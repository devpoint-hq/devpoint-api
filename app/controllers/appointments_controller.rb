class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @appointment = current_user.appointments.build(create_appointment_params)
    if @appointment.save
      render :appointment_created, status: :created
    else
      render :appointment_not_created, status: :unprocessable_entity
    end
  end

  def index
    @user_hosted_appointments = Appointment.hosted_by(current_user)
    @user_guested_appointments = Appointment.guested_by(current_user)
    render :index, status: :ok
  end

  def create_appointment_params
    params.except(:format, :appointment).permit(:appointment_guest_id, :location, :time, :video_conf_link)
  end
end
