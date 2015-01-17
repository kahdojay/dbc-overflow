class CommentsController < ApplicationController
  include AuthsHelper

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.create(answers_params)
    redirect_to question_path(question, "answers" => answer.id)
  end

end