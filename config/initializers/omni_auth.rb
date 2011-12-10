Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "104624819657263", "60319e0bd1f72eb527502589e8abf562", :scope => 'email', :display => 'page'
end 