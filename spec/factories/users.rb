FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_furigana    {"タナカ"}
    first_name_furigana   {"タロウ"}
    birth                 {"1990-01-01"}
  end
end

