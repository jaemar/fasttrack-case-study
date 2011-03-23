class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :users, :through => :shares
end
