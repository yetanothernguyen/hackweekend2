class Membership < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  
  scope :pending, where(:status => 'pending')
  
  def approve!
    self.update_attribute(:status, 'approved')
  end
  
  def reject!
    self.update_attribute(:status, 'rejected')
  end
end
