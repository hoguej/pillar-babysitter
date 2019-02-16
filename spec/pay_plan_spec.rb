require_relative 'spec_helper'

describe PayPlan do
  it 'should create new PayPlan' do
    @pay_plan = PayPlan.new
    expect(@pay_plan).to be_a(PayPlan)
  end
end