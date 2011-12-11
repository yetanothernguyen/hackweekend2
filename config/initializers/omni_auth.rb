Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.app_id, Settings.app_secret, :scope => 'email', :display => 'page'
end 