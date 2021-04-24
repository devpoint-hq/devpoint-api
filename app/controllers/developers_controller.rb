class DevelopersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @developers = User.all_with_developer_details
    render :index, status: :ok
  end

  def show
    @user = User.is_developer_with_details(params[:id])
    if @user
      render :show, status: :ok
    else
      render :no_developer, status: :not_found
    end
  end
end
