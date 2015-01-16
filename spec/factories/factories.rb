FactoryGirl.define do
  # @word = Faker::Internet.user_name
  factory :user do
    name { Faker::Internet.user_name }
    password { Faker::Internet.password }
  end
end
