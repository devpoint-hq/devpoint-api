class JobsController < ApplicationController

  private

  def job_params
    params.require(:job).permit(:title, :company_name, :start_date, :end_date)
  end
end
