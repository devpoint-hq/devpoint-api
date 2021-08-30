class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    UserMailer.account_confirmed(resource).deliver
    redirect_to 'https://anewman15-dev-point.netlify.app/login'
  end

  private

  def after_confirmation_path_for(resource_name)
    redirect_to 'https://anewman15-dev-point.netlify.app/login' if resource_name.confirmed?
  end
end
