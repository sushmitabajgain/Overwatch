Raven.configure do |config|
  config.dsn = 'https://a8118ff6c68047b69f8a6cc706322047:c26e2a13074f40619b7a204994041966@sentry.net/22'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.environments = ['dev', 'staging', 'production']
end