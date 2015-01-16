class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable

  validates_presence_of :body
  validates_presence_of :title
  validates_presence_of :user_id

  def self.search(words)
    matches = []
    words.split(' ').each do |word|
      matches << Question.all.select { |q| q.title.include?(word) || q.body.include?(word) }
    end
    matches.flatten.uniq
  end
end