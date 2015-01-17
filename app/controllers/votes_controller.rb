class VotesController < ApplicationController
  def create
    vote = Vote.new(vote_params)
    if vote.save
      redirect_to root_path
    else
      set_error('Login to vote.')
      redirect_to '/login'
    end
  end

  def vote_params
    params.require(:vote).permit(:user_id, :votable_type, :votable_id, :upvote)
  end
end
