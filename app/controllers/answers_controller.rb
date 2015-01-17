class AnswersController < ApplicationController

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
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(answers_params)
      redirect_to question_path(@answer.question_id)
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