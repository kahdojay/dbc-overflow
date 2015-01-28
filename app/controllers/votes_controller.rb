class VotesController < ApplicationController
  include AuthsHelper

  def upvote
    # There's too much thinking in this action....it shoudl be pushed to a model
    existing_vote = find_any_vote
    if existing_vote && existing_vote.upvote == false
      existing_vote.destroy
    elsif existing_vote && existing_vote.upvote == true
      # hate hate hate hat hate empty conditional brackets
    else
      votable = vote_params[:votable_type].constantize.create
      Vote.create(vote_params.merge(user_id: current_user.id))
    end
    redirect_to :back
  end

  def downvote
    return if 
    existing_vote = find_any_vote
    if existing_vote && existing_vote.upvote == true
      existing_vote.destroy
    elsif existing_vote && existing_vote.upvote == false
      # hate hate hate hat hate empty conditional brackets
    else
      Vote.create(vote_params)
    end
    redirect_to :back
  end

  def find_any_vote
    Vote.find_by(user_id: current_user.id, votable_type: vote_params[:votable_type], votable_id: vote_params[:votable_id])
  end

  def vote_params
    params.require(:vote).permit(:votable_type)
  end
end
