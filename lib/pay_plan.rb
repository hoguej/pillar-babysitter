class PayPlan
  attr_reader :pay_schedules

  def initialize
    @pay_schedules = []
    @rates_by_hour = {}
  end

  def add_pay_schedule(pay_schedule)
    calc_end_time = pay_schedule.end_time
    @pay_schedules << pay_schedule
  end

  def rate_for_hour(hour)
    return 100
  end
end
