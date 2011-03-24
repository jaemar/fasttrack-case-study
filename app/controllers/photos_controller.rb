class PhotosController < ApplicationController
  def index
    @photo = Photo.find(params[:id])
  end

  def move
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      redirect_to albums_path
    else
      render :index
    end
  end

  def create
    @album = Album.find(params[:album_id])
    @photos = @album.photos.build(params[:photo])

    if @photos.save
      flash[:notice] = "Photo uploaded."
      redirect_to @album
    else
      flash[:alert] = "Photo cannot be uploaded."
      redirect_to @album
    end
  end

end
