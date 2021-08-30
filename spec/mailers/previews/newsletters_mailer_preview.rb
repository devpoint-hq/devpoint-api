# Preview all emails at http://localhost:3000/rails/mailers/monday_morning_newsletter
class NewslettersMailerPreview < ActionMailer::Preview
  def monday_morning_newsletter
    NewslettersMailer.monday_morning_newsletter(User.first)
  end
end
