class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def create
    if User.exists?(email: params[:user][:email])
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      render :session_created, status: :created
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    yield if block_given?
    render json: { message: 'Signed out successfully.' }, status: :ok
  end
end
