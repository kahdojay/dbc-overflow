class UsersController < ApplicationController
	include AuthsHelper

	def index
		redirect_to :root unless current_admin
		@users = User.all
	end

	def new
		redirect_to :show if current_user
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		redirect_to :root unless current_admin || current_user.id == @user.id
	end

	def edit
		@user = User.find(params[:id])
		redirect_to :root unless current_admin || current_user.id == @user.id
	end

	def create
		redirect_to :show if current_user
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			redirect_to :root
		else
			render :new
		end
	end

	def update
		@user = User.find(params[:id])
		redirect_to :root unless current_admin || current_user.id == @user.id
		if @user.update_attributes(user_params)
			render :show
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		redirect_to :root unless current_admin || current_user.id == @user.id
		if @user.destroy
			if @user.id = session[:id]
				redirect_to :logout
			else
				render :index
 			end
 		else
			set_error("there was a problem deleting the account")
			render :back
		end
	end 

	private

		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation)
		end

end
