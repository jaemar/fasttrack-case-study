class SharesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @share = Share.new
    @album = Album.find(params[:album_id])
  end

  def create
    @share = Share.new(:user_id => params[:share][:user_id], :album_id => params[:album_id])
    @album = Album.find(params[:album_id])
    if current_user.id != params[:share][:user_id].to_i
      unless !User.exists?(:id => params[:share][:user_id])
        if !Share.exists?(:user_id => params[:share][:user_id], :album_id => params[:album_id]) 
          if @share.save
            redirect_to albums_path, :notice => 'Shared successfully.'
          end
        else
          redirect_to albums_path, :notice => "You are already sharing this album to ID = ".concat(params[:share][:user_id])
        end
      else
        redirect_to albums_path, :notice => "User ID don't exist!"
      end
    else
      redirect_to albums_path, :notice => 'Prohibited sharing album to self!'
    end

  end

  def destroy
    @share = Share.find(:first, :conditions => ['user_id = ? AND album_id = ?', params[:user_id], params[:album_id]])
    @share.destroy
    flash[:notice] = "Unshared successfully."
    redirect_to albums_path
  end

end
