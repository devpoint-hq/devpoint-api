class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def validate_session
    if user_session
      render :session_validated, status: :ok
    else
      render json: { message: 'No active session' }, status: :unauthorized
    end
  end

  def create
    @user = User.new(create_user_params)
    if @user.save
      render :created, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  def create_user_params
    params.permit(:email, :username, :password, :password_confirmation)
  end
end
