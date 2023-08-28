class OrderClient
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :delivery_address_id, :city, :block, :build, :phone_num, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :delivery_address_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    # 購入した商品のIDとユーザーIDを保存、orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 購入者の情報を保存し、order_idを作成する
    Client.create(order_id: order.id, post_code: post_code, delivery_address_id: delivery_address_id, city: city,
                  block: block, build: build, phone_num: phone_num)
  end
end
