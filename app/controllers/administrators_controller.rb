class AdministratorsController < ApplicationController
  def index
    @users = User.all
    @albums = Album.all
    @registered_users_today = User.where("created_at BETWEEN ? AND ?", Time.now.change(:hour => 0, :min => 0, :sec => 1), Time.now.change(:hour => 23, :min => 59, :sec => 59))
    @uploaded_photos_today = Photo.where("created_at BETWEEN ? AND ?", Time.now.change(:hour => 0, :min => 0, :sec => 1), Time.now.change(:hour => 23, :min => 59, :sec => 59))
    @blocked_users = Invitation.find_all_by_status(Invitation::BlockStatus)
  end

  def show
    @user = User.find_by_id(params[:id])
    @blocked_user = Invitation.order("updated_at DESC").find_all_by_user_id_and_status(params[:id], Invitation::BlockStatus)
  end
end
