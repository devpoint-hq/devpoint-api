json.message 'New session created.'
json.user do
  json.id current_user.id
  json.email current_user.email
  json.username current_user.username
  json.first_name current_user.first_name
  json.last_name current_user.last_name
  json.other_names current_user.other_names if current_user.other_names
  json.profile_image_url current_user.profile_image_url.split('?').first if current_user.profile_image.attached?
end
