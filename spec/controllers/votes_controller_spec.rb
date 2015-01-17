require 'rails_helper'

describe VotesController do
  describe '#create' do
    context 'on the welcome#index page'
      it 'creates a vote record with the correct user_id'
      it 'creates a vote record with the correct question_id'
      it 'creates a vote record with the upvote attribute as true'
      it 'adds the vote to the votes table in the db'
    end
  end
end
