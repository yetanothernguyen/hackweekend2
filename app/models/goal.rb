class Goal < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  after_create :set_token

  protected

  def set_token
    self.token = Token.get_token(self.id)
    self.save
  end

end
