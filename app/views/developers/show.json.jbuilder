json.user do
  json.id @user.id
  json.username @user.username
  json.first_name @user.names.first.first_name
  json.last_name @user.names.first.last_name
  json.links @user.links do |link|
    json.id link.id
    json.link_name link.name
    json.url link.url
  end
  json.skills @user.skills do |skill|
    json.id skill.id
    json.skill_name skill.name
  end
  json.jobs @user.jobs do |job|
    json.title job.title
    json.company_name job.company_name
  end
end
