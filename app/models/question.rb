class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :tags
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :body
  validates_presence_of :title
  validates_presence_of :user_id


  def vote_count
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end

  def create_tags(string)
    string.split(',').each{ |tag| self.tags.create(name: tag)}
  end

  def self.search(words)
    matches = []
    words.split(' ').each do |word|
      matches << Question.all.select { |q| q.title.include?(word) || q.body.include?(word) }
    end
    matches.flatten.uniq
  end
end
