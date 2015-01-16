class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable

  validates_presence_of :body
end