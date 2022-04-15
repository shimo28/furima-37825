FactoryBot.define do
  factory :item do
    title {'test'}
    explanation {'test'}
    price {2000} 
    category_id {2}
    condition_id {2}
    prefecture_id {2}
    shipping_burden_id {2}
    delivery_day_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
