class NewslettersSubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def update
    @newsletters_subscription = NewslettersSubscription.where(id: params[:id]).first
    if @newsletters_subscription.update!(newsletters_subscription_params)
      render json: { status: 'updated', message: 'Subscription updated successfully!' }
    else
      render status: :unprocessable_entity
    end
  end

  private

  def newsletters_subscription_params
    params.require(:newsletters_subscription).permit(:monday_morning_newsletter, :featured_developer_newsletter)
  end
end
