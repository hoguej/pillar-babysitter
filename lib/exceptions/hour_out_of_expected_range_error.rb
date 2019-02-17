class HourOutOfExpectedRangeError < ArgumentError
  attr_reader :min_start_time, :max_end_time

  def initialize(msg= "Hour is outside of expected range")
    super
  end
end