require 'rails_helper'

describe VotesController do
  context 'Questions' do
    describe '#upvote' do
      before :each do
        @user = FactoryGirl.create(:user)
        @question = FactoryGirl.create(:question)
        @question.votes.create(user_id: @user.id, upvote: true)
      end

      it 'creates a vote record with the correct user_id' do
        expect(@question.votes.last.user_id).to eq(@user.id)
      end

      it 'creates a vote record with the correct question_id' do
        expect(@question.votes.last.votable_id).to eq(@question.id)
      end

      it 'creates a vote record with the upvote attribute as true' do
        expect(@question.votes.last.upvote).to eq(true)
      end

      it 'adds the vote to the votes table in the db' do
        expect{@question.votes.create(user_id: @user.id, upvote: true)}.to change{Vote.count}.by(1)
      end
    end

    describe '#downvote' do
      before :each do
        @user = FactoryGirl.create(:user)
        @question = FactoryGirl.create(:question)
        @question.votes.create(user_id: @user.id, upvote: false)
      end

      it 'creates a vote record with the correct user_id' do
        expect(@question.votes.last.user_id).to eq(@user.id)
      end

      it 'creates a vote record with the correct question_id' do
        expect(@question.votes.last.votable_id).to eq(@question.id)
      end

      it 'creates a vote record with the upvote attribute as true' do
        expect(@question.votes.last.upvote).to eq(false)
      end

      it 'deletes an existing upvote by the user if it exists' do
      end

      it 'adds the vote to the votes table in the db' do
        expect{@question.votes.create(user_id: @user.id, upvote: false)}.to change{Vote.count}.by(1)
      end
    end
  end
end
