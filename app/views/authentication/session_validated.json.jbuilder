json.message 'Your session is active.'
json.user do
  json.id current_user.id
  json.email current_user.email
  json.username current_user.username
  json.first_name current_user.first_name
  json.last_name current_user.last_name
  json.other_names current_user.other_names
end
