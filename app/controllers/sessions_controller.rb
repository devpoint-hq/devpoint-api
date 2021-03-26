class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    return unless User.exists?(username: create_session_params[:username])

    @user = User.find_by(username: create_session_params[:username])
    if @user.valid_password?(create_session_params[:password])
      render :session_created, status: :created
    else
      render json: { message: 'Invalid credentails.' }
    end
  end

  def destroy
    @user = User.where(username: params[:username])
    if @user.update!(
      authentication_token: nil,
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
      render json: { message: 'Session ended successfully' }, status: :ok
    else
      head(:unauthorized)
    end
  end

  private

  def create_session_params
    params.permit(:username, :password)
  end
end
