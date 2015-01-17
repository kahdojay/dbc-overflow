class VotesController < ApplicationController
  def upvote
    if Vote.find_by(vote_params)
      redirect_to :back
    elsif Vote.new(vote_params).save
      redirect_to :back
    else
      set_error('Login to vote.')
      redirect_to '/login'
    end
  end

  def vote_params
    params.require(:vote).permit(:user_id, :votable_type, :votable_id, :upvote)
  end
end
