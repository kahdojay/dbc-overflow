FactoryGirl.define do
    factory :answer do
        user_id 1
        question_id 1
        body "Check out the Rails Guides and you'll find the answer!"

        factory :invalid_answer do
          body nil
        end
    end
end
