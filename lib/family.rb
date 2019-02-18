class Family
  attr_accessor :pay_plan, :name

  def initialize(params = {})
    self.pay_plan = params[:pay_plan] if params[:pay_plan]
    self.name = params[:name] if params[:name]
  end
end