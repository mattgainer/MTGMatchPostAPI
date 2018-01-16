require 'securerandom'
class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by(name: session_params[:username]).try(:authenticate, session_params[:password])
    if @user
      @user.update(token: SecureRandom.urlsafe_base64)
      render json: {user: @user.as_json}
    else
      render json: {error: "Username or Password Incorrect"}, status: 401
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
