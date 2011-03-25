class SharesController < ApplicationController
  before_filter :authenticate_user!
  

  def show
    @share = Share.new
    @album = Album.find(params[:album_id])
  end

  def create
    if current_user.id != :user_id
      if User.exists?(:id => params[:share][:user_id])
        unless Share.exists?(:user_id => params[:share][:user_id], :album_id => params[:album_id]) 
          @share = Share.create(:user_id => params[:share][:user_id], :album_id => params[:album_id])
          if @share.save
            redirect_to albums_path, :notice => 'Shared successfully.'
          else
            render "show", :notice => 'Shared unsuccessful!'
          end
        else
          redirect_to albums_path, :notice => 'Already shared this album'
        end
      else
        redirect_to albums_path, :notice => 'User does not exist.'
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
