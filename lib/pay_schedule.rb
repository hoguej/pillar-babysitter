class PaySchedule
  attr_reader :rate, :shift

  def initialize(params = {})
    @shift = Shift.new
    @shift.start_time = params[:start_time] if params[:start_time]
    @shift.end_time = params[:end_time] if params[:end_time]
    self.rate = params[:rate] if params[:rate]
  end

  def start_time=(start_time)
    shift.start_time = start_time
    @start_time = start_time
  end

  def start_time
    shift.start_time
  end

  def end_time=(end_time)
    shift.end_time = end_time
    @end_time = end_time
  end

  def end_time
    shift.end_time
  end

  def rate=(rate)
    unless rate.kind_of?(Integer) && rate > 0
      raise "Rate must be a positive integer"
    end
    @rate = rate
  end
end