class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(create_user_params)
    if @user.save
      render :created, status: :ok
    elsif User.exists?(username: @user.username) || User.exists?(email: @user.email)
      render :user_exists, status: :unprocessable_entity
    elsif @user.password != @user.password_confirmation
      render :password_mismatch, status: :unprocessable_entity
    else
      render :user_not_created, status: :unprocessable_entity
    end
  end
end
