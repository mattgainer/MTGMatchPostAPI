class Api::UsersController < ApplicationController
  def create
    @user = User.new(name: user_params[:username], password: user_params[:password])
    if @user.save
      @user.update(token: SecureRandom.urlsafe_base64)
      render json {user: @user.as_json}
    else
      render json: {error: @user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
