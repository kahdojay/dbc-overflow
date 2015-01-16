class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			redirect_to :root
		else
			render :new
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation)
		end



end