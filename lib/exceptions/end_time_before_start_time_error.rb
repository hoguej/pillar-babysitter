class EndTimeBeforeStartTimeError < ArgumentError
  def initialize(msg = "End time can't be before start time")
    super
  end
end