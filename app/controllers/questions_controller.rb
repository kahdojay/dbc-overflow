class QuestionsController < ApplicationController
  include AuthsHelper

  def index
    @questions = Question.all
  end

  def new
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create
    # params[:question][:user_id] = current_user.id
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      #error_message?
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :user_id)
    end
end