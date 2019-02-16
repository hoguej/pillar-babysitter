class PaySchedule
  attr_reader :start_time, :end_time, :rate

  def initialize(params = {})
    self.start_time = params[:start_time] if params[:start_time]
    self.end_time = params[:end_time] if params[:end_time]
    self.rate = params[:rate] if params[:rate]
  end

  def start_time=(start_time)
    error_message = 'Start time must be after 5 pm and no later than 3 am'

    valid_start_times = [5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 3]
    unless valid_start_times.include?(start_time) 
      raise 'Start time must be after 5 pm and no later than 3 am'
    end
    @start_time = start_time
  end

  def end_time=(end_time)
    valid_end_times = [6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4]
    unless valid_end_times.include?(end_time)
      raise 'End time must be after 6 pm and no later than 4 am'
    end

    @end_time = end_time
  end

  def rate=(rate)
    unless rate.kind_of?(Integer) && rate > 0
      raise "Rate must be a positive integer"
    end
    @rate = rate
  end
end