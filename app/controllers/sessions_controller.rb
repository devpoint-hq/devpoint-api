class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    return unless User.exists?(email: create_session_params[:email])

    @user = User.find_by(email: create_session_params[:email])
    if @user.valid_password?(create_session_params[:password])
      render :show, status: :created
    else
      render json: { message: 'Invalid credentails.' }
    end
  end

  def update
    @user = User.where(email: params[:email])
    if @user.update(
      authentication_token: nil,
      password: params[:password],
      password_confirmation: params[:password]
    )
      render json: { message: 'Session ended successfully' }, status: :ok
    else
      head(:unauthorized)
    end
  end

  private

  def create_session_params
    params.permit(:email, :password)
  end
end
