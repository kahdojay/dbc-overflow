FactoryGirl.define do
  factory :question do
    user_id 1
    title { Faker::Lorem.words }
    body {Faker::Lorem.sentences}
  end
end