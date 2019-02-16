class Rate
  attr_reader :start_time, :end_time

  def start_time=(start_time)
    error_message = "Start time must be after 5 pm and no later than 3 am"

    valid_start_times = [5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 3]
    unless valid_start_times.include?(start_time) 
      raise "Start time must be after 5 pm and no later than 3 am"
    end
    @start_time = start_time
  end

  def end_time=(end_time)
    @end_time = end_time
  end
end