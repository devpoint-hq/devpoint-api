json.message 'User created successfully!'
json.user do
  json.username @user.username
  json.email @user.email
end
