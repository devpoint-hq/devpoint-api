json.message 'Your session is active.'
json.user do
  json.id current_user.id
  json.email current_user.email
  json.username current_user.username
end
