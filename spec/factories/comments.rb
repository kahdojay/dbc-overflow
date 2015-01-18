FactoryGirl.define do
  factory :comment do
    user_id { Faker::Number.number(1) }
    commentable_id { 1 }
    body { Faker::Lorem.sentence }

    factory :q_comment do
      commentable_type 'Question'
    end

    factory :a_comment do
      commentable_type 'Answer'
    end
    factory :invalid_comment do
      body nil
      commentable_type 'Answer'
    end
  end
end