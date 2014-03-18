Domimvp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = true
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  config.action_mailer.default_url_options = { :host => 'domiapp.co' }
  # ActionMailer Config
  # Setup for production - deliveries, no errors raised
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default :charset => "utf-8"

  config.action_mailer.smtp_settings = {
  :address => "smtp.mandrillapp.com",
  :port => 25,
  :user_name => ENV["madeleke13@gmail.com"],
  :password => ENV["wujwYuR4JB_JCH0DrqBZNw"]
  }

end
