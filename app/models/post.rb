class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal

  validates_presence_of :content

  default_scope :order => "created_at desc"
end
