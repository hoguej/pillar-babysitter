class PayPlan
  attr_reader :pay_schedules

  def initialize
    @pay_schedules = []
  end

  def add_pay_schedule(pay_schedule)
    @pay_schedules << pay_schedule
  end
end