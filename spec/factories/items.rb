FactoryBot.define do
  factory :item do
    name              { Faker::Team.name } 
    description       { Faker::Lorem.sentence }
    condition_id      { 2 }
    category_id       { 2 }
    shipping_cost_id  { 2 }
    shipping_area_id  { 2 }
    shipping_day_id   { 2 }
    price             { 1000 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end