class SharesController < ApplicationController

  def show
    @share = Share.new
    @album = Album.find(params[:album_id])
  end

  def create
    unless current_user.user_id != :user_id
    unless Share.exists?(:user_id => params[:share][:user_id], :album_id => params[:album_id])
      @share = Share.create(:user_id => params[:share][:user_id], :album_id => params[:album_id])
      if @share.save
          redirect_to albums_path, :notice => 'Shared successfully.'
      else
        render "show", :notice => 'Shared unsuccessful!'
      end
    end
    end
  end
  def destroy
    @share = Share.find(:first, :conditions => ['user_id = ? AND album_id = ?', params[:user_id], params[:album_id]])
    @share.destroy
    flash[:notice] = "Unshared successfully."
    redirect_to albums_path
  end

end
