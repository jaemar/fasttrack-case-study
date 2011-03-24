class Photo < ActiveRecord::Base
  belongs_to :album

  has_attached_file :photo, :styles => { :medium => "100x100>", :thumb => "50x50>" }
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
