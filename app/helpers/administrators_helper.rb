module AdministratorsHelper
  def change_datetime_to_date(datetime)
    date = datetime.strftime( "%d / %m / %Y" )
  end

  def get_block_count(user_id, updated_at)
    block_count = Invitation.where("(user_id = ?) AND (updated_at BETWEEN ? AND ?)", user_id,Time.now.change(:year => updated_at.strftime("%Y").to_i, :month => updated_at.strftime("%m").to_i, :day => updated_at.strftime("%d").to_i, :hour => 0, :min => 0, :sec => 1), Time.now.change(:year => updated_at.strftime("%Y").to_i, :month => updated_at.strftime("%m").to_i, :day => updated_at.strftime("%d").to_i, :hour => 23, :min => 59, :sec => 59)).count
  end
end
