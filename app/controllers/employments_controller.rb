class EmploymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @employment = current_user.employments.build(employment_params)

    if @employment.save
      render :employment_created, status: :created
    else
      render :employment_not_created, status: :unprocessable_entity
    end
  end

  def index
    @jobs = current_user.jobs
  end

  private

  def employment_params
    params.require(:employment).permit(:title, :company_name, :start_date, :end_date)
  end
end
