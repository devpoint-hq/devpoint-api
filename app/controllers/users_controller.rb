class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(user_params)
    @user.hiring_manager = true

    if @user.save
      render :created, status: :ok
    else
      render :user_not_created, status: :unprocessable_entity
    end
  end

  def update
    profile_image = user_params[:profile_image] if user_params[:profile_image]
    params = user_params.except(:profile_image)
    profile_image_attached = current_user.attach(profile_image) if profile_image

    if profile_image_attached && current_user.update!(params)
      render json: { message: 'User updated successfully.' }, status: :ok
    else
      render json: { message: 'Something went wrong. User not updated.' }, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :profile_image)
  end
end
