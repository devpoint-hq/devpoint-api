class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      render :link_created, status: :created
    else
      render :link_not_created, status: :unprocessable_entity
    end
  end

  def index
    @links = current_user.links
  end

  def destroy
    @link = Link.where(id: params[:id]).first

    if @link
      if @link.destroy
        render :link_destroyed, status: :ok
      else
        render :link_not_destroyed, status: :unprocessable_entity
      end
    else
      render :link_does_not_exist, status: :not_found
    end
  end

  private

  def link_params
    params.require(:link).permit(:name, :url)
  end
end
