require_relative 'spec_helper'

describe PayPlan do
  before(:each) do
    @pay_plan = PayPlan.new
  end

  it 'should create new PayPlan' do
    expect(@pay_plan).to be_a(PayPlan)
  end

  it 'should be able to add a pay_schedule' do
    pay_schedule = PaySchedule.new
    @pay_plan.add_pay_schedule(pay_schedule)
    expect(@pay_plan.pay_schedules).to eq([pay_schedule])
  end
end