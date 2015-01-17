require 'faker'

User.create(name: "Hailey", password: "a")
User.create(name: "Don J.", password: "a")
User.create(name: "Frank", password: "a")
User.create(name: "Mike", password: "a")
User.create(name: "Peter", password: "a")

20.times { User.create(name: Faker::Name.name, password: "a") }



rand(5..20).times {
  user = User.find(rand(1..25))
  user.questions.create(title: Faker::Lorem.sentence + "?", body: Faker::Lorem.paragraph)
}

rand(5..20).times {
  user = User.find(rand(1..20))
  q_num = Question.all.length
  user.answers.create(question_id: rand(1..q_num), body: Faker::Lorem.paragraph)
}

# seed random number of upvotes for all answers
Answer.all.each do |answer|
  rand(5..20).times { answer.votes.create(user_id: rand(User.count), upvote: true) }
end

# seed random number of upvotes for all questions
Question.all.each do |question|
  rand(5..20).times { question.votes.create(user_id: rand(User.count), upvote: true) }
end

