class Album < ActiveRecord::Base
  validates_presence_of:name
  belongs_to :user
  has_many :shares
  has_many :photos
  has_many :users, :through => :shares
end
