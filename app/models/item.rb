class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many_attached :images
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :schedule_delivery
  has_one :purchase_record

  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :sales_status_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :schedule_delivery_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :images, presence: true,
                     length: { minimum: 1, maximum: 3, message: "は1枚以上、3枚以下にしてください"}
end
