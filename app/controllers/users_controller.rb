class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(create_user_params)
    if @user.save
      render :created, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  def show
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
      render :show, status: :ok
    else
      render :no_user, status: :not_found
    end
  end

  def create_user_params
    params.permit(:email, :username, :password, :password_confirmation)
  end
end
