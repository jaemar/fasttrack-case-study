class SharesController < ApplicationController

  def show
    @share = Share.new
    @album = Album.find(params[:album_id])
  end

  def create
    @share = Share.create(params[:share])
    if @share.save
      redirect_to albums_path, :notice => 'Shared successfully.'
    else
      render "show", :notice => 'Shared unsuccessful!'
    end
  end

  def destroy
    @share = Share.find(:first, :conditions => ['user_id = ? AND album_id = ?', params[:user_id], params[:album_id]])
    @share.destroy
    flash[:notice] = "Unshared successfully."
    redirect_to albums_path
  end

end
