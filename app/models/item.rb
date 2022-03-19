class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :schedule_delivery

  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :price, in: 300..9_999_999
  validates :category_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :sales_status_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :schedule_delivery_id, numericality: { other_than: 1, message: "Can't be blank" }
  validates :image, presence: true
end
