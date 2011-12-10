class Goal < ActiveRecord::Base

  validates_presence_of :title

  after_create :set_token

  protected

  def set_token
    self.token = Token.get_token(self.id)
    self.save
  end

end
