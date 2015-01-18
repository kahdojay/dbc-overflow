class WelcomeController < ApplicationController
  def search
    @questions = Question.search(params[:q])
    render 'index'
  end
end