class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    params[:question][:user_id] = 1
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question.id)
    else
      #error_message?
      redirect_to :back
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :user_id)
    end
end