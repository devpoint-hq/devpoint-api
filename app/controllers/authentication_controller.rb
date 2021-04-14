class AuthenticationController < ApplicationController
  def index
    if user_session
      render :session_validated, status: :ok
    else
      render json: { message: 'No active session' }, status: :unauthorized
    end
  end
end
