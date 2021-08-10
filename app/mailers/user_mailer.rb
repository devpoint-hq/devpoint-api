class UserMailer < ApplicationMailer
  def account_confirmed(user)
    @user = user
    mail(
      from: 'accounts@anewman15-dev-point.netlify.app',
      to: @user.email,
      subject: 'Your account at DevPoint has been confirmed'
    )
  end
end
