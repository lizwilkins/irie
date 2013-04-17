class ApplicationController < ActionController::Base
  
  protect_from_forgery

  check_authorization

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    # Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    flash[:error] = "Access denied."
    redirect_to root_path
  end

  def current_user
    if @current_user == nil
      if session[:user_id] then @current_user = User.find(session[:user_id]) end
    end
    @current_user   

    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def authorize
  #   redirect_to root_path, alert: "Not authorized." if current_user.nil?
  # end 

  # def admin_required
  #   unless current_user && current_user.is_admin?
  #     flash[:error] = "Sorry, you don't have access to that."
  #     redirect_to root_path and return false
  #   end
  # end
end
