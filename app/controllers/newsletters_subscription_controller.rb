class NewslettersSubscriptionController < ApplicationController
  def update
    @newsletters_subscription = NewslettersSubscription.where(params[:id]).first
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
