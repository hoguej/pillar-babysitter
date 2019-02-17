require 'active_support/core_ext/range/overlaps'

class Shift
  attr_accessor :start_time, :end_time

  MIN_START_TIME = 5
  MAX_END_TIME = 4

  def initialize(params = {})
    self.start_time = params[:start_time] if params[:start_time]
    self.end_time = params[:end_time] if params[:end_time]
  end

  def start_time=(start_time)
    @start_time_as_date = start_time_to_date_time(start_time)
    @start_time = start_time
  end

  def end_time=(end_time)
    @end_time_as_date = end_time_to_date_time(end_time)
    @end_time = end_time
  end

  def start_time_to_date_time(hour)
    if(hour >= MIN_START_TIME && hour <= 12)
      return Time.new(1978, 9, 12, hour)
    elsif (hour >= 1 && hour < MAX_END_TIME)
      return Time.new(1978, 9, 13, hour)
    else
      raise "Start time must be after #{MIN_START_TIME} pm and no later than #{MAX_END_TIME - 1} am"
    end
  end

  def end_time_to_date_time(hour)
    if(hour > MIN_START_TIME && hour <= 12)
      return Time.new(1978, 9, 12, hour)
    elsif (hour >= 1 && hour <= MAX_END_TIME)
      return Time.new(1978, 9, 13, hour)
    else
      raise "End time must be after #{MIN_START_TIME + 1} pm and no later than #{MAX_END_TIME} am"
    end
  end

  def hour_to_date_time(hour)
    if(hour >= MIN_START_TIME && hour <= 12)
      return Time.new(1978, 9, 12, hour)
    elsif (hour >= 1 && hour <= MAX_END_TIME)
      return Time.new(1978, 9, 13, hour)
    end
  end

  def include?(hour)
    (@start_time_as_date..@end_time_as_date).include?(hour_to_date_time(hour))
  end

  def overlaps?(shift)
    # add / subtract a millisecond so that it doesn't report an overlap if it's only a border overlap
    ((start_time+1)..(end_time-1)).overlaps?((shift.start_time+1)..(shift.end_time-1))
  end
end