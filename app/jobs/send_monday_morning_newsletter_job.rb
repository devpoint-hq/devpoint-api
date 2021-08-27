class SendMondayMorningNewsletterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @users = User.where(hiring_manager: true)
    @users.each do |user|
      UserMailer.send_monday_morning_newsletter(user).deliver
      sleep 2
    end
  end
end
