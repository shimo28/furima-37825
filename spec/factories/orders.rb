FactoryBot.define do
  factory :order do
    zip { '123-4567' }
    prefecture_id { 2 }
    city { 'test' }
    house_number { 'test' }
    phone_number { '08011112222' }
    building_name { 'test' }
    association :user
    association :item
  end
end