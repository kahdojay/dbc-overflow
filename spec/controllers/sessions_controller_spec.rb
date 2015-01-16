require 'factory_girl'
require 'rails_helper'

describe SessionsController do
  describe '#login' do
    context 'without valid credentials' do
      it 'renders the login page' do
        @invalid_user = User.create(name: '', password: '')
        post :create, user: @invalid_user.attributes
        expect(response).to render_template('sessions/login')
      end
    end
  end

  describe '#logout' do
    before :each do
      @user = FactoryGirl.create(:user)
      post :create, user: @user.attributes
    end

    # it 'clears the session[:id]' do
    #   expect(session[:id]).to eq(@user.id)
    #   get :logout, id: @user
    #   expect(session[:id]).to eq(nil)
    # end

    it 'redirects the user to the root_url' do
      get :logout, id: @user
      expect(response).to redirect_to root_url
    end
  end
end
