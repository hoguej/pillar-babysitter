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

  it 'should give back the rate, given an hour of the day with multiple schedules' do
    pay_schedule1 = PaySchedule.new(start_time: 5, end_time: 6, rate: 100)
    pay_schedule2 = PaySchedule.new(start_time: 6, end_time: 7, rate: 9)
    @pay_plan.add_pay_schedule(pay_schedule1)
    @pay_plan.add_pay_schedule(pay_schedule2)
    rate5 = @pay_plan.rate_for_hour(5)
    rate6 = @pay_plan.rate_for_hour(6)
    expect([rate5, rate6]).to eq([100, 9])
  end

  it 'should not allow you to add overlapping schedules where the second schedule is within the first' do
    pay_schedule1 = PaySchedule.new(start_time: 5, end_time: 8, rate: 100)
    pay_schedule2 = PaySchedule.new(start_time: 6, end_time: 7, rate: 9)
    @pay_plan.add_pay_schedule(pay_schedule1)
    expect {
      @pay_plan.add_pay_schedule(pay_schedule2)
    }.to raise_error OverlappingDateRangesError
  end
end