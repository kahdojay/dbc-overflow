require 'spec_helper'

describe SessionsController do
  describe '#login' do
    context 'with valid credentials' do
      before :each do
        user = create(:user)
      end

      it 'creates a session upon login' do
        # send user login params to create_session
        # expect sessoin[:id] to be user.id
        expect(session[:id]).to eq(user.id)
      end
    end

    context 'without valid credentials' do
      xit 'redirects a user with invalid credentials to the login page'
      xit 'displays an error message for users with invalid credentials'
    end
  end
end
