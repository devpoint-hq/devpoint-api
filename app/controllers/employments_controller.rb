class EmploymentsController < ApplicationController

  private

  def employment_params
    params.require(:employment).permit(:title, :company_name, :start_date, :end_date)
  end
end
