FactoryGirl.define do
  # @word = Faker::Internet.user_name
  factory :user do
    name { Faker::Internet.user_name }
    password { Faker::Internet.password }
  end

  factory :question do
    user_id { rand(User.count) }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
