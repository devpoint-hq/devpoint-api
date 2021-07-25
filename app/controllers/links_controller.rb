class LinksController < ApplicationController
  def create
    @link = current_user.links.build(link_params)

    if @link.save
      render :link_created, status: :created
    else
      render :link_not_created, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:name, :url)
  end
end
