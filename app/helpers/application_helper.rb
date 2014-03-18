module ApplicationHelper
  def datetime_to_string(date_time)
    date_time.strftime('%-m/%e/%y %l:%M %P')
  end


  def boolean_to_s(value)
    value ? "Yes" : "Maybe soon!"
  end 
end
