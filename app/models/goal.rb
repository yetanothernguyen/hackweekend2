class Goal < ActiveRecord::Base
  include TokenFinder
  
  validates_presence_of :title

  belongs_to :user
  has_many :memberships
  has_many :members, :source => :user, :through => :memberships, :conditions => "status = 'approved'"
  has_many :posts
  belongs_to :city
  
  before_save :parse_date
  before_save :set_city_id
  after_create :set_token

  scope :recent, order("created_at DESC")
  scope :current, where(["date >= ?", Time.now])

  def distance(city_name)
    to_city = City.find_by_name(city_name)
    return 9999999 if to_city.nil?
    Geocoder::Calculations.distance_between([city.latitude.to_f, city.longitude.to_f], [to_city.latitude.to_f, to_city.longitude.to_f], :units => :km)
  end

  protected

  def set_token
    self.token = Token.get_token(self.id)
    self.save
  end

  def set_city_id
    city = City.find_by_name(self.location)
    self.city_id = city.id if city
  end

  def parse_date
    str = self.title.dup
    str.slice!(" at ")
    str.slice!(" on ")
    str.slice!(" in ")
    self.date = Chronic.parse(str)
  end

end
