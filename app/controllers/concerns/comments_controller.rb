class CommentsController < ApplicationController
  include AuthsHelper

  def create
    @question = Question.find(q_params[:question_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to question_path(@question)
    else
      flash[:alert] = "ERROR: #{@question.errors.full_messages.join("; ")}"
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @question = Question.find(@comment.get_question_id)
    if @comment.update(comment_params)
      redirect_to question_path(@question)
    else
       flash[:alert] = "ERROR: #{@question.errors.full_messages.join("; ")}"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end


  private
    def comment_params
      params.require(:comment).permit(:commentable_id, :commentable_type, :body, :user_id)
    end
    def q_params
      params.require(:comment).permit(:question_id)
    end


end