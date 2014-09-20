# Controller to manage login
class LoginController < ApplicationController
  layout false
  def new
    redirect_to root_url if @current_user
  end

  def create
    return if redirect_if_user
    return if error_on_wrong_user
    return unless user = error_on_wrong_password

    session[:user_email] = user.email
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end

  private

  def redirect_if_user
    redirect_to(root_url, status: :found) if @current_user
  end

  def error_on_wrong_user
    unless User.where(email: params[:email]).exists?
      flash[:error] = 'This user doesn\'t exist.'
      redirect_to :back
    end
  end

  def error_on_wrong_password
    unless user = User.authenticate(params[:email], params[:password])
      flash[:error] = 'Wrong password.' 
      redirect_to :back
    end
    user
  end

end
