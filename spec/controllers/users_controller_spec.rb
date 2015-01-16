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
			@user = FactoryGirl.create( :user )
			get :show, id: @user.id
		end

		it "renders the #show template" do
			expect(response).to render_template :show
		end

	end

end
