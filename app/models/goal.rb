class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :members, :source => :user, :through => :memberships
  scope :recent, order("created_at DESC")
  
  validates_presence_of :title
  after_create :set_token

  protected

  def set_token
    self.token = Token.get_token(self.id)
    self.save
  end

end
