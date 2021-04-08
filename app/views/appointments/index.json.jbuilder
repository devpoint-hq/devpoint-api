json.appointments do
  json.hosted @user_hosted_appointments do |appointment|
    json.id appointment.id
    json.guest do
      json.id appointment.appointment_guest.id
      json.first_name appointment.appointment_guest.names.first.first_name
      json.last_name appointment.appointment_guest.names.first.last_name
    end
    json.time appointment.time
    json.location appointment.location
    json.confirmed appointment.confirmed
    json.video_conf_link appointment.video_conf_link
  end
  json.guested @user_guested_appointments do |appointment|
    json.id appointment.id
    json.host do
      json.id appointment.appointment_host.id
      json.first_name appointment.appointment_host.names.first.first_name
      json.last_name appointment.appointment_host.names.first.last_name
    end
    json.time appointment.time
    json.location appointment.location
    json.confirmed appointment.confirmed
    json.video_conf_link appointment.video_conf_link
  end
end
