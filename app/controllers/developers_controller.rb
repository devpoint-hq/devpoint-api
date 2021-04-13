class DevelopersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @developers = User.is_developer.with_links.with_skills.with_jobs
    render :index, status: :ok
  end

  def show
    @user = User.is_developer.with_links.with_skills.with_jobs.where(id: params[:id]).first
    if @user
      render :show, status: :ok
    else
      render :no_developer, status: :not_found
    end
  end
end
