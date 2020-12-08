FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { gimei.first.kanji + gimei.first.hiragana + gimei.first.katakana }
    last_name { gimei.last.kanji + gimei.last.hiragana + gimei.last.katakana }
    pseudonym_first { gimei.first.katakana }
    pseudonym_last { gimei.last.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
