FactoryGirl.define do
  factory :question_upvote do
      user_id 1
      votable_type "Question"
      votable_id 1
      upvote true
  end
  factory :question_downvote do
      user_id 1
      votable_type "Question"
      votable_id 1
      upvote false
  end
  factory :answer_upvote do
      user_id 1
      votable_type "Answer"
      votable_id 1
      upvote true
  end
  factory :answer_downvote do
      user_id 1
      votable_type "Answer"
      votable_id 1
      upvote false
  end
end
