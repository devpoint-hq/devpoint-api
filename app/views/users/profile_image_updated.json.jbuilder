json.status 'success'
json.message 'Profile image updated successfully!'
json.profile_image_url current_user.profile_image_url.split('?').first
