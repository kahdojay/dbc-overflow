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

	describe 'POST #create' do

		before :each do
			@user = {name: "butch", password: "123", password_confirmation: "123"}
			post :create, user: @user
		end

		it "redirects to #root" do
			expect(response).to redirect_to :root
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

	describe 'GET #edit' do

		before :each do
			@user = FactoryGirl.create( :user )
			get :edit, id: @user.id
		end

		it "renders the #show template" do
			expect(response).to render_template :edit
		end

	end

	describe 'PUT #update' do

		before :each do
			@user = FactoryGirl.create( :user )
			get :edit, id: @user.id
		end

	end

	describe 'DELETE #destroy' do

		before :each do
			@user = FactoryGirl.create( :user )
			get :edit, id: @user.id
		end

	end
	
end
