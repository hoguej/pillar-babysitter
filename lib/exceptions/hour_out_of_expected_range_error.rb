class HourOutOfExpectedRangeError < ArgumentError
  attr_reader :min_start_time, :max_end_time

  def initialize(params = {})
    @min_start_time = params[:min_start_time]
    @max_end_time = params[:max_end_time]

    if params[:msg]
      super(params[:msg])
    elsif @min_start_time && @max_end_time
      msg = "Hour must be after #{@min_start_time} PM and no later than #{@max_end_time} AM"
      super(msg)
    else
      super "Hour is outside of expected range"
    end
  end
end