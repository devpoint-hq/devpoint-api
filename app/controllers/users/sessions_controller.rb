class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def validate
    if user_session
      render json: { message: 'Your session is active.' }
    else
      render json: { message: 'Please sign in.' }
    end
  end

  def create
    if User.exists?(email: params[:user][:email])
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      respond_with_authentication_token(resource)
    else
      render json: { message: 'Invalid credentials' }
    end
  end

  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    yield if block_given?
    render json: { message: 'Signed out successfully.' }
  end

  protected

  def respond_with_authentication_token(resource)
    render json: {
      success: true,
      id: resource.id,
      username: resource.username,
      email: resource.email
    }
  end
end
