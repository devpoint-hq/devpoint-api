class NewslettersMailer < ApplicationMailer
  def monday_morning_newsletter(user)
    @user = user
    mail(
      from: 'accounts@anewman15-dev-point.netlify.app',
      to: @user.email,
      subject: 'Monday is for People With a Mission'
    )
  end
end
