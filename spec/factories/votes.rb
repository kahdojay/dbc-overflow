FactoryGirl.define do
  factory :qupvote do
    user_id {1}
    votable_type {"Question"}
    votable_id {1}
    upvote {true}
  end
  factory :qdownvote do
    user_id {1}
    votable_type {"Question"}
    votable_id {1}
    upvote {false}
  end
  factory :aupvote do
    user_id {1}
    votable_type {"Answer"}
    votable_id {1}
    upvote {true}
  end
  factory :adownvote do
    user_id {1}
    votable_type {"Answer"}
    votable_id {1}
    upvote {false}
  end
end
