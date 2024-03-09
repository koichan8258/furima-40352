FactoryBot.define do
  factory :item do
    item_name             { Faker::Commerce.product_name }
    explain               { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    situation_id          { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id       { Faker::Number.between(from: 2, to: 4) }
    selling_price         { Faker::Number.between(from: 300, to: 9_999_999) }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end