class JobsController < ApplicationController
  def create
    @job = current_user.jobs.build(jobs_params)

    if @job.save
      render :job_created, status: :created
    else
      render :job_not_created, status: :unprocessable_entity
    end
  end

  def index
    @jobs = current_user.jobs
  end

  private

  def job_params
    params.require(:job).permit(:title, :company_name, :start_date, :end_date)
  end
end
