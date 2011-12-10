class Goal < ActiveRecord::Base
  include TokenFinder
  
  belongs_to :user
  has_many :memberships
  has_many :members, :source => :user, :through => :memberships, :conditions => "status = 'approved'"
  has_many :posts
  
  scope :recent, order("created_at DESC")
  
  validates_presence_of :title
  before_save :parse_date
  after_create :set_token

  protected

  def set_token
    self.token = Token.get_token(self.id)
    self.save
  end

  def parse_date
    str = self.title
    str.slice!(" at ")
    str.slice!(" on ")
    str.slice!(" in ")
    self.date = Chronic.parse(str)
  end

end
