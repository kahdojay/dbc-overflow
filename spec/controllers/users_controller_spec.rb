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

	describe 'GET #new' do

		before :each do
			get :new
		end

		it "renders the #new template" do
			expect(response).to render_template :new
		end

	end

	describe 'GET #show' do

		before :each do
			get :show
		end

		it "renders the #show template" do
			expect(response).to render_template :show
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
