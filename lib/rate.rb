class Rate
  attr_reader :start_time

  def start_time=(start_time)
    if(start_time < 1)
      raise "Start time must be above 1"
    end
    @start_time = start_time
  end
end