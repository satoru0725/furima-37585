FactoryBot.define do
  factory :item do
    image                   { Faker::Lorem.sentence }
    name                    { Faker::Commerce.product_name }
    info                    { Faker::Lorem.sentence }
    price                   { Faker::Number.between(from: 300, to: 9999999) }
    category_id             { Faker::Number.between(from: 2, to: 11) }
    sales_status_id         { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_status_id  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    schedule_delivery_id    { Faker::Number.between(from: 2, to: 4) }
    
  end
end
