FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    password { name }
  end
end
