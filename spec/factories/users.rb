FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    password { Faker::Internet.password }

    factory :admin do
      is_admin true
    end
  end
end
