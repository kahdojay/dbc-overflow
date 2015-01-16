class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by(name: login_params[:name])
  end

  def logout
  end

  def login_params
    params.require(:session).permit(:name, :password)
  end
end
