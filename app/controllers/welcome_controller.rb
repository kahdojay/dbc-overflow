class WelcomeController < ApplicationController
  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show

  end

  def search
    @questions = Question.search(params[:q])
    render 'index'
  end
end