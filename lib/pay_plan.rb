class PayPlan
  attr_reader :pay_schedules

  def initialize
    @pay_schedules = []
    @rates_by_hour = {}
  end

  def add_pay_schedule(new_pay_schedule)
    @pay_schedules.each do |existing_pay_schedule|
      raise "New pay schedule should not overlap existing pay schedules" if existing_pay_schedule.overlaps?(new_pay_schedule)
    end
    @pay_schedules << new_pay_schedule 
  end

  def rate_for_hour(hour)
    @pay_schedules.each do |pay_schedule|
      return pay_schedule.rate if pay_schedule.include?(hour)
    end
    return nil
  end
end
