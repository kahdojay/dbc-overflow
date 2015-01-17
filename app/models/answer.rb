class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :body

  def vote_count
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end
end
