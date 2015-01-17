class AnswersController < ApplicationController
  include AuthsHelper

  def show
    @question = Question.find(params[:question_id])
  end

  def new
    @answer = Answer.find(params[:id])
    @question = @answer.question

    render 'new', locals: {answer: @answer, question: @question}

  end

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.create(answers_params)
    redirect_to question_path(question, "answers" => answer.id)
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    redirect_to root_path unless @answer.user_id == current_user.id
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    redirect_to root_path unless @answer.user_id == current_user.id
    if @answer.update_attributes(answers_params)
      redirect_to question_path(@answer.question_id)
    else
      render 'edit'
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    redirect_to root_path unless answer.user_id == current_user.id
    answer.destroy
    redirect_to question_path(answer.question_id)
  end

  def answers_params
    params.require(:answer).permit(:body, :user_id)
  end

end
