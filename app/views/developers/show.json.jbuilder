json.developer do
  json.id @user.id
  json.username @user.username
  json.email @user.email
  json.developer 'Yes' if @user.developer
  json.hiring_manager 'Yes' if @user.hiring_manager
  json.admin 'Yes' if @user.admin
end
