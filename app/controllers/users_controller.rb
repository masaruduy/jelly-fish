class UsersController < ApplicationController
  def index
  end

  def update
    @current_user.update(user_params)


    redirect_to action: :index
  end

  private

    def user_params
      params.require(:user).permit(:kijiji_user, :kijiji_password, :password)
    end
end
