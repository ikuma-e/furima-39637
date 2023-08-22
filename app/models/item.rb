class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_address
  belongs_to :delivery_price
  belongs_to :delivery_time
  belongs_to :state

  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :image, presence: true

  # 以下カテゴリは---の時、保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_price_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_address_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" }
end
