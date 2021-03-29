class DevelopersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @developers = User.where(developer: true)
    render :index, status: :ok
  end

  def show
    if User.exists?(id: params[:id]) && User.find(params[:id])
      @user = User.find(params[:id])
      render :show, status: :ok if @user.developer
    else
      render :no_developer, status: :not_found
    end
  end
end
