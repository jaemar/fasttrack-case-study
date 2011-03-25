module AdministratorsHelper
  def change_datetime_to_date(datetime)
    date = datetime.strftime( "%d / %m / %Y" )
    return date
  end
end
