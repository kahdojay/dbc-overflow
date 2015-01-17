class VotesController < ApplicationController
  def upvote
    existing_vote = find_any_vote
    if existing_vote && existing_vote.upvote == false
      existing_vote.destroy
    elsif existing_vote && existing_vote.upvote == true
    else
      Vote.create(vote_params)
    end
    redirect_to :back
  end

  def downvote
    existing_vote = find_any_vote
    if existing_vote && existing_vote.upvote == true
      existing_vote.destroy
    elsif existing_vote && existing_vote.upvote == false
    else
      Vote.create(vote_params)
    end
    redirect_to :back
  end

  def find_any_vote
    Vote.find_by(user_id: vote_params[:user_id], votable_type: vote_params[:votable_type], votable_id: vote_params[:votable_id])
  end

  def vote_params
    params.require(:vote).permit(:user_id, :votable_type, :votable_id, :upvote)
  end
end
