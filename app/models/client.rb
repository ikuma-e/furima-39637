class Client < ApplicationRecord
  belongs_to :order

  # ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_address
end
