class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: :create

  def create
    @user = User.new(user_params)
    @user.hiring_manager = true

    if @user.save
      render :created, status: :ok
    else
      render :user_not_created, status: :unprocessable_entity
    end
  end

  def update
    profile_image = user_params[:profile_image] if user_params[:profile_image]
    params = user_params.except(:profile_image)
    profile_image_attached = current_user.profile_image.attach(profile_image) if profile_image

    if profile_image_attached || current_user.update!(params)
      render :user_updated, status: :ok
    else
      render :user_not_updated, status: :unprocessable_entity
    end
  end

  def user_params
    user_attributes = %i[email username password password_confirmation first_name last_name other_names profile_image]
    params.require(:user).permit(user_attributes)
  end
end


# {
#   "direct_upload": {
#       "url": "https://dev-point-anewman15.s3.ca-central-1.amazonaws.com/uploads/abac3e8e-2735-47c7-b280-3f20f6b3f0cb?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASSIJJW7R62KH74F7%2F20210731%2Fca-central-1%2Fs3%2Faws4_request&X-Amz-Date=20210731T150541Z&X-Amz-Expires=600&X-Amz-SignedHeaders=content-length%3Bcontent-md5%3Bcontent-type%3Bhost&X-Amz-Signature=309380e85da01e768ee76d89ecabfcc7d11b46609586dbc14025a90bf2aa56e4",
#       "headers": {
#           "Content-Type": "image/png",
#           "Content-MD5": "C+rgtr+Mompxe1wK3PBP8g=="
#       }
#   },
#   "blob_signed_id": "eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--053aa29b88e01713350505046f2b1c5f4a859823"
# }