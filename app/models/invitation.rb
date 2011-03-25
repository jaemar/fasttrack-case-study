class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :invited_user, :class_name => "User"

  AcceptedStatus = 0
  RejectedStatus = 1
  PendingStatus = 2
  BlockStatus = 3

  def check_status()
    case status
      when Invitation::AcceptedStatus
        'Accepted'
      when Invitation::RejectedStatus
        'Rejected'
      when Invitation::PendingStatus
        'Pending'
      when Invitation::BlockStatus 
        'Block'
    end
  end
end
