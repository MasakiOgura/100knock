# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_datetime(datetime)
    datetime.strftime("%m月%d日 %I時%M分")
  end

end