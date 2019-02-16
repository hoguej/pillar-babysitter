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

  it 'should give the rate for a given hour in pay_schedule' do
    pay_schedule = PaySchedule.new(start_time: 5, end_time: 6, rate: 100)
    @pay_plan.add_pay_schedule(pay_schedule)
    expect(@pay_plan.rate_for_hour(5)).to eq(100)
  end

  #it 'should give back the rate, given an hour of the day with multiple schedules' do
    #pay_schedule1 = PaySchedule.new(start_time: 5, end_time: 6, rate: 100)
    #pay_schedule2 = PaySchedule.new(start_time: 6, end_time: 7, rate: 9)
    #@pay_plan.add_pay_schedule(pay_schedule1)
    #@pay_plan.add_pay_schedule(pay_schedule2)
    #expect([@pay_plan.rate(5), @pay_plan.rate(6)]).to eq([100, 9])
  #end
end