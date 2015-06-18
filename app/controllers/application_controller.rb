class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action do
    flash[:alert] = nil
  end

  private
    def set_error_flash(error_object)
      flash[:alert] = "ERROR: #{error_object.errors.full_messages.join("; ")}"
    end
end
