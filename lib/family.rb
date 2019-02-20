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
    families_hash.keys.map do |name|
      Family.new(name: name)
    end
  end
end