class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def validate
    if user_session
      render json: { message: 'Your session is active.' }
    else
      render json: { message: 'Please sign in.' }
    end
  end
end
