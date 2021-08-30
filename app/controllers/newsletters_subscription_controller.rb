class NewslettersSubscriptionController < ApplicationController
  def update
    @newsletters_subscription = NewslettersSubscription.where(params[:id]).first
    if @newsletters_subscription.update!(newsletters_subscription_params)
      render json: { status: 'updated', message: 'Subscription updated successfully!' }
    else
      render status: :unprocessable_entity
    end
  end
end
