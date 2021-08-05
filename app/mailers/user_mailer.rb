class UserMailer < ApplicationMailer
  def confirm_account(user)
    @user = user
    mail(
      from: 'confirm_account@anewman15-dev-point.netlify.app',
      to: @user.email,
      subject: 'Confirm Your Account at anewman15-dev-point'
    )
  end
end
