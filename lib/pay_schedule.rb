require_relative 'shift'
require_relative 'exceptions/must_be_positive_integer_error'

class PaySchedule < Shift
  attr_reader :rate

  def initialize(params = {})
    super
    self.rate = params[:rate] if params[:rate]
  end

  def rate=(rate)
    unless rate.kind_of?(Integer) && rate > 0
      raise MustBePositiveIntegerError
    end
    @rate = rate
  end
end