class AdministratorsController < ApplicationController
  def index
    @users = User.all
    @albums = Album.all
    @registered_users_today = User.where("created_at BETWEEN ? AND ?", Time.now.change(:hour => 0, :min => 0, :sec => 1), Time.now.change(:hour => 23, :min => 59, :sec => 59))
    @uploaded_photos_today = Photo.where("created_at BETWEEN ? AND ?", Time.now.change(:hour => 0, :min => 0, :sec => 1), Time.now.change(:hour => 23, :min => 59, :sec => 59))
    @blocked_users = Invitation.group("user_id, updated_at").having(["status = ?", Invitation::BlockStatus.to_i]).order('updated_at DESC')
  end
end
