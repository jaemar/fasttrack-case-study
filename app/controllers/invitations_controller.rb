class InvitationsController < ApplicationController
  def index
  end

  def invite
    @invite = current_user.invitations.build(:user_id => current_user.id, :invited_user_id => params[:id], :status => 2 )

    if @invite.save
      redirect_to root_path
    end

  end

end
