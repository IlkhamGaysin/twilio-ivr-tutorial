Twilio.configure do |config|
  config.account_sid = ENV.fetch('ACCOUNT_SID', '')
  config.auth_token = ENV.fetch('TWILIO_AUTH_TOKEN', '')
end
