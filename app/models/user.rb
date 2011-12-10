class User < ActiveRecord::Base
  has_many :authentications, :dependent => :delete_all do
		def facebook
			where(:provider => 'facebook').first
		end
	end
  has_many :goals
  has_many :memberships
  has_many :posts

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
  
  def joined?(goal)
    goal.memberships.include?(self)
  end
end
