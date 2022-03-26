class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-) or Eenter a number in half-width"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true }, length: { in:10..11}
    validates :token
  end

  def save
    purchase = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, phone_number: phone_number, purchase_record_id: purchase.id)
  end
end