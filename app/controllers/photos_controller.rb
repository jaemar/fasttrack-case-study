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

end
