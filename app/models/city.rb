class City < ActiveRecord::Base
  has_many :goals

  def self.to_options
    City.find(:all, :order => 'name').map{ |c| [c.name, c.id] }
  end
end
