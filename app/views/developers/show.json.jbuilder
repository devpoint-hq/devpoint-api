json.user do
  json.id @user.id
  json.username @user.username
  json.first_name @user.first_name if @user.first_name
  json.last_name @user.last_name if @user.last_name
  json.other_names @user.other_names if @user.other_names
  json.developer 'Yes' if @user.developer

  json.links @user.links do |link|
    json.id link.id
    json.link_name link.name
    json.url link.url
  end
  json.skills @user.skills do |skill|
    json.id skill.id
    json.skill_name skill.name
    json.self_rating skill.self_rating
    json.experience skill.years_of_experience
    json.projects_count skill.number_of_projects
  end
  json.employments @user.employments do |employment|
    json.title employment.title
    json.company_name employment.company_name
  end
end
