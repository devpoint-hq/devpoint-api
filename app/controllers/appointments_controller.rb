class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    return head(:unprocessable_entity) unless User.exists?(create_appointment_params[:appointment_host_id])

    user = User.find(create_appointment_params[:appointment_host_id])
    @appointment = user.hosted_appointments.build(create_appointment_params)
    if @appointment.save
      render :appointment_created, status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def create_appointment_params
    params.permit(:appointment_host_id, :appointment_guest_id, :time, :online_link)
  end
end
