json.user_jobs do
  json.user_id current_user.id
  json.jobs @jobs do |job|
    json.job_id job.id
    json.job_title job.title
    json.start_date job.start_date
    json.start_end job.start_end
  end
end
