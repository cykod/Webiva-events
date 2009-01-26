

module Events::TimeHelper


  def time_display(offset,fmt = nil)
    (Time.now.at_midnight + offset * 60).strftime((fmt||"%I:%M %p").t)
  end
  
  
  def time_calc(start_date,offset)
    tm = start_date.to_time.at_midnight + offset.minutes
  end 
end
