class AnswersController < ApplicationController

  def show
    @question = Question.find(params[:question_id])
  end

  def new
    render 'new'
  end

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.create(answers_params)
    redirect_to question_path(question, "answers" => answer.id)
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answers_params)
      redirect_to question_answer_path
    else
      render 'edit'
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to questions_path
  end

  def answers_params
    params.require(:answer).permit(:body, :user_id)
  end

end