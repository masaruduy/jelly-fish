class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login, :current_user

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  
  def require_login
    unless session[:user_id] || params[:controller] == 'login'
      flash[:error] = 'You must be logged in to access this section'
      redirect_to login_url # halts request cycle
    end
  end
end
