class WelcomeController < ApplicationController
  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
  end

  def unanswered_questions
    @questions = Question.all.select{|q| q.answers.count == 0}
    render 'index'
  end

  def search
    @questions = Question.search(params[:q])
    render 'index'
  end
end