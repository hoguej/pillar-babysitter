class StartTimeAfterEndTimeError < ArgumentError
  def initialize(msg = "Start time can't be after end time.")
    super
  end
end