FactoryGirl.define do
    factory :answer do
        user_id 1
        question_id 1
        body "Check out the Rails Guides and you'll find the answer!"
    end
end

FactoryGirl.define do
    factory :question do
        user_id 1
        title {Faker::Lorem.words}
        body "This is the question"
    end
end