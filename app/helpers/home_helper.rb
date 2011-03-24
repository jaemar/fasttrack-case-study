module HomeHelper
  def latest_photo(album_id)
    Photo.find(:last, :conditions => ['album_id = ?', album_id])
  end
end
