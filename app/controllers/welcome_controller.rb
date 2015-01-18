class WelcomeController < ApplicationController

  def search
    @questions = Question.search(params[:q])
    render "questions/index.html.erb"
  end
  
end