json.user_employments do
  json.user_id current_user.id
  json.employments @employments do |employment|
    json.employment_id employment.id
    json.employment_title employment.title
    json.start_date employment.start_date
    json.end_date employment.end_date
  end
end
