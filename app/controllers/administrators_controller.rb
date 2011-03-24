class AdministratorsController < ApplicationController
  def index
    @users = User.all
    @albums = Album.all
    @registered_users_today = User.where("created_at BETWEEN ? AND ?", Time.now.change(:hour => 0, :min => 0, :sec => 1), Time.now.change(:hour => 23, :min => 59, :sec => 59))
    @uploaded_photos_today = Photo.where("created_at BETWEEN ? AND ?", Time.now.change(:hour => 0, :min => 0, :sec => 1), Time.now.change(:hour => 23, :min => 59, :sec => 59))
  end
end
