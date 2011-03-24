class SharesController < ApplicationController

  def show
    @share = Share.new
    @shares = User.includes(:shares).find(params[:id])
    @album = Album.find(params[:album_id])
  end

  def create
    #@album = Album.find(params[:album_id])
    @share = Share.create(params[:share])
    if @share.save
      redirect_to albums_path, :notice => 'Shared successfully.'
    else
      render "show", :notice => 'Shared unsuccessful!'
    end
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy
    flash[:notice] = "Unshared successfully."
    redirect_to shares_path
  end

end
