class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      render :job_created, status: :created
    else
      render :job_not_created, status: :unprocessable_entity
    end
  end

  def index
    @jobs = current_user.jobs
  end

  def destroy
    @job = Job.where(id: params[:id]).first

    if @job
      if @job.destroy
        render :job_destroyed, status: :ok
      else
        render :job_not_destroyed, status: :unprocessable_entity
      end
    else
      render :job_does_not_exist, status: :not_found
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company_name, :start_date, :end_date)
  end
end
