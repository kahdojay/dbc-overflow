class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates_presence_of :body
  validates_presence_of :commentable_id
  validates_presence_of :commentable_type
  validates_presence_of :user_id

  def get_question_id
    if self.commentable_type == "Question"
      return self.commentable_id
    else
      return Answer.find(self.commentable_id).question_id
    end
  end

end