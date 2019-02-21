class BabySitter
  attr_reader :last_pay_per_hour

  def initialize
    @last_pay_per_hour = []
  end

  def calculate_pay_for_shift(params)
    family = params[:family]
    shift = params[:shift]

    @last_pay_per_hour = []

    total = 0
    shift.hours.map do |hour|
      rate = family.pay_plan.rate_for_hour(hour)
      @last_pay_per_hour << { hour: hour, rate: rate }
      total += rate
    end
    return total
  end
end