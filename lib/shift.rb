require 'active_support/core_ext/range/overlaps'
require 'active_support/core_ext/numeric/time'
require 'exceptions/hour_out_of_expected_range_error'
require 'exceptions/start_time_after_end_time_error'
require 'exceptions/end_time_before_start_time_error'

class Shift
  attr_accessor :start_time, :end_time

  # Note:
  # MIN_START_TIME is assumed to be PM on day 1
  # MAX_END_TIME is assumed to be AM on day 2
  MIN_START_TIME = 5
  MAX_END_TIME = 4

  def initialize(params = {})
    self.start_time = params[:start_time] if params[:start_time]
    self.end_time = params[:end_time] if params[:end_time]
  end

  #
  # Convert and store to date/time so we can do easy time math, and the time range crosses the day border
  # If the requirements change to deal with specific date/times, this should be fairly easy to refactor
  #
  def start_time=(start_time)
    start_time_candidate = start_time_to_date_time(start_time)
    if(@end_time_as_date && start_time_candidate > @end_time_as_date)
      raise StartTimeAfterEndTimeError.new
    end
    @start_time_as_date = start_time_candidate
    @start_time = start_time
  end

  def end_time=(end_time)
    end_time_candidate = end_time_to_date_time(end_time)
    if(@start_time_as_date && end_time_candidate < @start_time_as_date)
      raise EndTimeBeforeStartTimeError.new
    end
    @end_time_as_date = end_time_candidate
    @end_time = end_time
  end

  def start_time_to_date_time(hour)
    if(hour >= MIN_START_TIME && hour <= 12)
      return Time.new(1978, 9, 12, hour + 12)
    elsif (hour >= 1 && hour < MAX_END_TIME)
      return Time.new(1978, 9, 13, hour)
    else
      raise HourOutOfExpectedRangeError.new
    end
  end

  def end_time_to_date_time(hour)
    if(hour > MIN_START_TIME && hour <= 12)
      return Time.new(1978, 9, 12, hour + 12)
    elsif (hour >= 1 && hour <= MAX_END_TIME)
      return Time.new(1978, 9, 13, hour)
    else
      raise HourOutOfExpectedRangeError.new
    end
  end

  def hour_to_date_time(hour)
    if(hour >= MIN_START_TIME && hour <= 12)
      return Time.new(1978, 9, 12, hour + 12)
    elsif (hour >= 1 && hour <= MAX_END_TIME)
      return Time.new(1978, 9, 13, hour)
    end
  end

  def include?(hour)
    (@start_time_as_date..@end_time_as_date-1).include?(hour_to_date_time(hour))
  end

  def overlaps?(shift)
    # add / subtract a millisecond so that it doesn't report an overlap if it's only a border overlap
    ((start_time+1)..(end_time-1)).overlaps?((shift.start_time+1)..(shift.end_time-1))
  end

  def hours
    return nil unless (@start_time_as_date && @end_time_as_date)

    return_hours = []
    hour_iterator = @start_time_as_date
    while hour_iterator < @end_time_as_date - 1
      return_hours << hour_iterator.strftime("%l").to_i
      hour_iterator += 1.hour
    end

    return return_hours
  end
end