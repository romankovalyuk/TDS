Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.cachestore = :memorystore

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  Rails.application.routes.default_url_options[:host] = 'domain.com'


  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true


  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #     :user_name => '32289eb96f2a8e7d4',
  #     :password => 'dec3f86ea050fa',
  #     :address => 'mailtrap.io',
  #     :domain => 'mailtrap.io',
  #     :port => '2525',
  #     :authentication => :cram_md5
  # }

  config.action_mailer.smtp_settings = {
      port:       587,
      address:    "smtp.mandrillapp.com",
      domain:      "domain.com",
      enable_starttls_auto: true,
      user_name:  'romankovalyuk@perfectial.com',
      password:   'LydfUja1tMNLaP_TL2mnEA'
  }

end
