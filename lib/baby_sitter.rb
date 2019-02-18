class BabySitter
  def calculate_pay_for_shift(params)
    family = params[:family]
    shift = params[:shift]

    total = 0
    shift.hours.map do |hour|
      total += family.pay_plan.rate_for_hour(hour)
    end
    return total
  end
end