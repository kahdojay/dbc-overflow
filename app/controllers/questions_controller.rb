class QuestionsController < ApplicationController

  def new
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :user_id)
    end
end