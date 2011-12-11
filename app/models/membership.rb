class Membership < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :goal_id
  
  scope :pending, where(:status => 'pending')
  
  def approve!
    self.update_attribute(:status, 'approved')
  end
  
  def reject!
    self.update_attribute(:status, 'rejected')
  end
end
