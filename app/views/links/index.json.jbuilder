json.user_links do
  json.user_id current_user.id
  json.links @links do |link|
    json.job_id link.id
    json.job_name link.name
    json.job_url link.url
  end
end
