json.user_links do
  json.user_id current_user.id
  json.links @links do |link|
    json.link_id link.id
    json.link_name link.name
    json.link_url link.url
  end
end
