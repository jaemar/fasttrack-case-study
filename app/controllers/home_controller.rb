class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @albums = Album.paginate :page => params[:page], :per_page => 5, :conditions => ['enabled = ? AND user_id = ?', true, current_user.id]
    @photo = @albums

    @shares = Share.paginate :page => params[:share_album], :per_page => 5, :conditions => ['user_id = ?', current_user.id]

    @invitations = Invitation.find(:all, :conditions => ['invited_user_id = ? AND status = ?', current_user.id, Invitation::PendingStatus])
  end

  def search
    @like = "%".concat(params[:name]).concat('%')
    @user = User.find(:all, :conditions => ['username LIKE ?  OR email LIKE ?', @like, @like ] )
    @invitations = Invitation.find(:all, :conditions => ['user_id = ? ', current_user.id])
  end
end
