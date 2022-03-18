class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category

  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1, message: "Can't be blank" }
end
