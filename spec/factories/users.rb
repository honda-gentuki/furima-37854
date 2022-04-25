FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.last_name }
    email                   { Faker::Internet.free_email }
    password                { 'takumaru12345' }
    password_confirmation   { password }
    first_name              { '鈴木' }
    last_name               { '一郎' }
    first_name_kana         { 'スズキ' }
    last_name_kana          { 'イチロウ' }
    birth_day               { '1990/12/12' }
  end
end