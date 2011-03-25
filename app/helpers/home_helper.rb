module HomeHelper
  def latest_photo(album_id)
    Photo.find(:last, :conditions => ['album_id = ?', album_id])
  end

  def get_album_name(album_id)
    Album.find_by_id(album_id)
  end

  def check_status(user_id, target_id)
    Invitation.find(:first, :conditions => ['user_id = ? AND invited_user_id = ?', user_id, target_id])
  end
end
