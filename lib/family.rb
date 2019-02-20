class Family
  attr_accessor :pay_plan, :name

  def initialize(params = {})
    if(params[:pay_plan])
      self.pay_plan = params[:pay_plan]
    else
      self.pay_plan = PayPlan.new
    end
    self.name = params[:name] if params[:name]
  end

  def self.load(families_hash)
    result = []
    families_hash.each_pair do |name, pay_schedules|
      family = Family.new(name: name)
      pay_schedules.each do |pay_schedule_hash|
        family.pay_plan.add_pay_schedule(PaySchedule.new(pay_schedule_hash))
      end
      result << family
    end
    return result
  end
end
