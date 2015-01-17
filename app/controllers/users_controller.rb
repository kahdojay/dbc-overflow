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

	def update
			@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			render :show
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
 		if @user.id = session[:id]
			if @user.destroy
				render :root
			else
				render :back
 			end
 		else
			if @user.destroy
				render :index
			else
				render :back
			end
		end
	end 

	private

		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation)
		end

end
