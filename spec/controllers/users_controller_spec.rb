require 'spec_helper'
require 'rails_helper'

describe UsersController do
	describe 'GET #index' do
		before :each do
			get :index
		end
		it "renders the #index template" do
			expect(response).to render_template :index
		end
	end

	# describe 'create a user' do
	# 	before :each do
	# 		User.create(name: "bob", password: "fox")
	# 	end
	# end

	# describe 'user access' do
	# 	before :each do
	# 		@user = create(:user)
	# 		session[:user_id] = @user.id
	# 	end
	# end	
end
