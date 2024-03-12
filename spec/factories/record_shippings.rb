FactoryBot.define do
  factory :record_shipping do
    post_cord     { '123-4567' }
    prefecture_id      { 1 }
    municipalities  { '東京都' }
    street_address  { '1-1' }
    building_name   { '東京ハイツ' }
    telephon_number { Faker::PhoneNumber.subscriber_number(length: rand(10..11)) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end