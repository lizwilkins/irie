class ApplicationController < ActionController::Base
  protect_from_forgery
 

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to root_path, alert: "Not authorized." if current_user.nil?
  end 

  def admin_required
    unless current_user && current_user.is_admin?
      flash[:error] = "Sorry, you don't have access to that."
      redirect_to root_path and return false
    end
  end
end
