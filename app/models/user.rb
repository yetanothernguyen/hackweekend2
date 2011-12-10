class User < ActiveRecord::Base
  has_many :authentications

  def self.create_from_omniauth(omniauth)
    Rails.logger.info omniauth.inspect
    user = User.new
    user.email = omniauth["info"]["email"] rescue nil
    user.username ||= omniauth["info"]["nickname"] rescue nil
    user.name ||= omniauth["info"]["name"] rescue nil
    
    user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    user.save
    
    return user
  end
end
