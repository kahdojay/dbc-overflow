FactoryGirl.define do
  factory :question do
    user_id { Faker::Number.number }
    title { Faker::Lorem.words }
    body {Faker::Lorem.sentences}
  end
end