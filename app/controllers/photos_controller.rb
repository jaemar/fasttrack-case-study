class PhotosController < ApplicationController
  def index
  end

  def create
    @album = Album.find(params[:album_id])
    @photos = @album.photos.build(params[:photo])

    if @photos.save
      flash[:notice] = "Photo uploaded."
      redirect_to @album
    else
      redirect_to root_path
    end
  end

end