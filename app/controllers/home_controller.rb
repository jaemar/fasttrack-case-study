class HomeController < ApplicationController
  def index
  end

  def search
    @like = "%".concat(params[:name]).concat('%')
    @user = User.find(:all, :conditions => ['username LIKE ?  OR email LIKE ?', @like, @like ] )
  end
end
