class SessionsController < ApplicationController
  include ErrorsHelper
  def login
  end

  def create
    user = User.find_by(name: login_params[:name])

    if user && user.authenticate(login_params[:password])
      session[:id] = user.id
      redirect_to root_url
    else
      set_error('Invalid login.')
      render 'login'
    end
  end

  def logout
    session[:id] = nil
    redirect_to root_url
  end

  def login_params
    params.require(:user).permit(:name, :password)
  end
end
