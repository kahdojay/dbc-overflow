module AuthsHelper
  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_admin
    if session[:id]
    	User.find(session[:id]).is_admin
    end
  end
end
