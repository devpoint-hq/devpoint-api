class UserMailer < ApplicationMailer
  def account_confirmed(user)
    @user = user
    mail(
      from: 'accounts@anewman15-dev-point.netlify.app',
      to: @user.email,
      subject: 'Your account at DevPoint has been confirmed'
    )
  end

  def send_monday_morning_newsletter(user)
    @user = user
    mail(
      from: 'accounts@anewman15-dev-point.netlify.app',
      to: @user.email,
      subject: 'Monday is for People With a Mission'
    )
  end
end
