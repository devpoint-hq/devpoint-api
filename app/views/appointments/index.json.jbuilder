json.user do
  json.id @user.id
  json.username @user.username
  json.email @user.email
end
json.hosted_appointments @user_hosted_appointments
json.guested_appointments @user_guested_appointments
