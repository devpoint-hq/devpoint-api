class DevelopersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @developers = User.joins(:names).where(developer: true)
    render :index, status: :ok
  end

  def show
    @user = User.joins(:names).where(id: params[:id]).first
    if @user
      render :show, status: :ok if @user.developer
    else
      render :no_developer, status: :not_found
    end
  end
end
