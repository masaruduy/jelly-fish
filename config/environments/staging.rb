require_relative "production"

Mail.register_interceptor(
  RecipientInterceptor.new("denis.pasin@gmail.com")
)

Rails.application.configure do
  # ...

  config.action_mailer.default_url_options = { host: 'staging.jelly-fish.com' }
end
