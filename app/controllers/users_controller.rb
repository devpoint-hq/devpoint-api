class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(create_user_params)
    @user.hiring_manager = true

    if @user.save
      render :created, status: :ok
    else
      render :user_not_created, status: :unprocessable_entity
    end
  end

  def create_user_params
    params.permit(:email, :username, :password, :password_confirmation)
  end
end
