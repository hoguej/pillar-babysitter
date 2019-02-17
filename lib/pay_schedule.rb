require_relative 'shift'

class PaySchedule < Shift
  attr_reader :rate

  def initialize(params = {})
    super
    self.rate = params[:rate] if params[:rate]
  end

  def rate=(rate)
    unless rate.kind_of?(Integer) && rate > 0
      raise "Rate must be a positive integer"
    end
    @rate = rate
  end
end