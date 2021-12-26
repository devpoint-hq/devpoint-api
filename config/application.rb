require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DevPoint
  class Application < Rails::Application
    # config.api_only = true
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.active_storage.service = :cloudinary

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               'anewman15-dev-point.netlify.app',
      user_name:            ENV['GMAIL_USERNAME'],
      password:             ENV['GMAIL_PASSWORD'],
      authentication:       'plain',
      enable_starttls_auto: true }

    config.active_job.queue_adapter = :sidekiq
  end

end
