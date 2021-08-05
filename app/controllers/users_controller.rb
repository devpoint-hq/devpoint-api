class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: :create

  def create
    @user = User.new(user_params)
    @user.hiring_manager = true

    if @user.save
      render :created, status: :ok
      UserMailer.confirm_account(@user).deliver
    else
      render :user_not_created, status: :unprocessable_entity
    end
  end

  def update
    profile_image = user_params[:profile_image] if user_params[:profile_image]
    params = user_params.except(:profile_image)
    profile_image_attached = current_user.profile_image.attach(profile_image) if profile_image

    if profile_image_attached
      render :profile_image_updated, status: :ok
    elsif current_user.update!(params)
      render :user_updated, status: :ok
    else
      render :user_not_updated, status: :unprocessable_entity
    end
  end

  def user_params
    user_attributes = %i[email username password password_confirmation first_name last_name other_names profile_image]
    params.require(:user).permit(user_attributes)
  end
end
