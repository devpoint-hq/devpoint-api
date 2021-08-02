json.user_skills do
  json.user_id current_user.id
  json.skills @skills do |skill|
    json.skill_id skill.id
    json.skill_name skill.name
    json.years_of_experience skill.years_of_experience
    json.number_of_projects skill.number_of_projects
    json.self_rating skill.self_rating
  end
end
