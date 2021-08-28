class SendMondayMorningNewsletterJob < ApplicationJob
  queue_as :default

  def perform
    @users = User.where(hiring_manager: true)
    @users.each do |user|
      NewslettersMailer.monday_morning_newsletter(user).deliver_now
      sleep 2
    end
  end
end
