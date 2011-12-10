class User < ActiveRecord::Base
  has_many :authentications
  has_many :goals

  def self.create_from_omniauth(omniauth, token = nil)
    user = User.new
    user.email = omniauth["info"]["email"] rescue nil
    user.username ||= omniauth["info"]["nickname"] rescue nil
    user.name ||= omniauth["info"]["name"] rescue nil
    
    user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    user.save

    if token
      goal = Goal.find_by_token(token)
      goal.user = user
      goal.save
    end
    
    return user
  end
end
