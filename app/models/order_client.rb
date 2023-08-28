class OrderClient
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :delivery_address_id, :city, :block, :build, :phone_num, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :delivery_address_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_num, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true
  def save
    # 購入した商品のIDとユーザーIDを保存、orderに代入する
    order = Order.create(user_id:, item_id:)
    # 購入者の情報を保存し、order_idを作成する
    Client.create(post_code:, delivery_address_id:, city:,
                  block:, phone_num:)
  end
end
