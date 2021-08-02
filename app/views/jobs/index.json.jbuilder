json.user_jobs do
  json.user_id current_user.id
  json.jobs @jobs do |job|
    json.job_id job.id
    json.job_title job.title
    json.start_date job.start_date
    json.end_date job.end_date
  end
end
