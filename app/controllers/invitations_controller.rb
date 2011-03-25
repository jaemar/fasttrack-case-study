class InvitationsController < ApplicationController
  def index
  end

  def invite
    @invite = current_user.invitations.build(:user_id => current_user.id, :invited_user_id => params[:id], :status => 2 )

    if @invite.save
      redirect_to root_path
    end

  end

  def list
    @invitations_receive = Invitation.find(:all, :conditions => ['invited_user_id = ? AND status = ?', current_user.id, Invitation::PendingStatus])
    @invitations_sent = Invitation.find(:all, :conditions => ['user_id = ? AND status = ?', current_user.id, Invitation::PendingStatus])
  end

  def accept
    @invitation = Invitation.find(:first, :conditions => ['user_id = ? AND invited_user_id = ?', params[:id], current_user.id])

    if @invitation.update_attributes(:status => Invitation::AcceptedStatus)
      redirect_to root_path, :notice => "accept"
    end
  end

  def reject
    @invitation = Invitation.find(:first, :conditions => ['user_id = ? AND invited_user_id = ?', params[:id], current_user.id])

    if @invitation.update_attributes(:status => Invitation::RejectedStatus)
      redirect_to root_path, :notice => "accept"
    end
  end

  def block
    @invitation = Invitation.find(:first, :conditions => ['user_id = ? AND invited_user_id = ?', params[:id], current_user.id])

    if @invitation.update_attributes(:status => Invitation::BlockStatus)
      redirect_to root_path, :notice => "accept"
    end
  end

  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@customer, :notice => 'Customer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end
end
