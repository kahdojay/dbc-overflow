require 'rails_helper'

describe SessionsController do
  describe '#login' do
    context 'with valid credentials' do
      before :each do
      end

      it 'creates a session upon login' do
        user = FactoryGirl.create(:user)

        # send user login params to session#create
        post :create, user: user.attributes

        # expect session[:id] to be user.id
        expect(session[:id]).to eq(user.id)
      end
    end

    # context 'without valid credentials' do
    #   xit 'redirects a user with invalid credentials to the login page'
    #   xit 'displays an error message for users with invalid credentials'
    # end
  end
end
