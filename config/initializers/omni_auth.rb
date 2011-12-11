Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.facebook.app_id, Settings.facebook.app_secret, :scope => 'email', :display => 'touch'
end 