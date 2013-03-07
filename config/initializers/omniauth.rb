OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"]
end

# Parche para que al fallar rediriga a 
# auth/failure como lo aria en produccion
OmniAuth.config.on_failure = Proc.new do |env|
 new_path = "/auth/failure"
 [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
end