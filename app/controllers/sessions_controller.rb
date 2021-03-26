class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    return unless User.exists?(username: create_session_params[:username])

    @user = User.find_by(username: create_session_params[:username])
    if @user.valid_password?(create_session_params[:password])
      render :session_created, status: :ok
    else
      render json: { message: 'Invalid credentails.' }
    end
  end

  private

  def create_session_params
    params.permit(:username, :password)
  end
end
