FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {'abc1234'}
    password_confirmation { password }
    last_name {'テスト'}
    first_name {'テスト'}
    last_name_kana {'テスト'}
    first_name_kana {'テスト'}
    birthday {Faker::Date.birthday}
  end
end