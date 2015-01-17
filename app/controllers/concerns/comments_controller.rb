class CommentsController < ApplicationController
  include AuthsHelper

  def create
    @question = Question.find(q_params[:question_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to question_path(@question)
    else
      #error_message?
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commentable_id, :commentable_type, :body, :user_id)
    end
    def q_params
      params.require(:comment).permit(:question_id)
    end

end