FactoryGirl.define do
  factory :question do
    user_id { Faker::Number.number(1) }
    title { Faker::Lorem.word }
    body {Faker::Lorem.sentence}

    factory :invalid_question do
      title nil
    end

  end
end