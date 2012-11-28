OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider '37signals', APP_CONFIG['signals_id'], APP_CONFIG['signals_secret']
end