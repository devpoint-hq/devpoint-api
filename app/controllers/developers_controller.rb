class DevelopersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @developers = User.where(developer: true)
    render :index, status: :ok
  end
end
