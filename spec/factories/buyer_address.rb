FactoryBot.define do
  factory :buyer_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Gimei.city.kanji }
    address { Gimei.town.kanji }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
