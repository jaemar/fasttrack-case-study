module HomeHelper
  def latest_photo(album_id)
    Photo.find(:last, :conditions => ['album_id = ?', album_id])
  end

  def get_album_name(album_id)
    Album.find_by_id(album_id)
  end
end
