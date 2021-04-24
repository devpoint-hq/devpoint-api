json.appointments do
  json.hosted @user_hosted_appointments do |appointment|
    json.id appointment.id
    json.guest do
      json.id appointment.appointment_guest.id
      json.email appointment.appointment_guest.email
      json.username appointment.appointment_guest.username
      json.first_name appointment.appointment_guest.first_name
      json.last_name appointment.appointment_guest.last_name
      json.other_names appointment.appointment_guest.other_names
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
      json.email appointment.appointment_host.email
      json.username appointment.appointment_host.username
      json.first_name appointment.appointment_host.first_name
      json.last_name appointment.appointment_host.last_name
      json.other_names appointment.appointment_host.other_names
    end
    json.time appointment.time
    json.location appointment.location
    json.confirmed appointment.confirmed
    json.video_conf_link appointment.video_conf_link
  end
end
