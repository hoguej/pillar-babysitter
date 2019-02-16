require_relative 'spec_helper'

describe PaySchedule do
  before(:each) do 
    @pay_schedule = PaySchedule.new
  end

  it 'should create a new PaySchedule object' do
    expect(@pay_schedule).to be_a(PaySchedule)
  end

  it 'should be able to set a start time' do
    @pay_schedule.start_time = 5
    expect(@pay_schedule.start_time).to be(5)
  end

  it 'should be able to set an end time' do
    @pay_schedule.end_time = 6
    expect(@pay_schedule.end_time).to be(6)
  end

  it 'should be able to set a PaySchedule' do
    @pay_schedule.rate = 5
    expect(@pay_schedule.rate).to be(5)
  end

  it 'should enforce all rates are positive integers' do
    expect {
      @pay_schedule.rate = 0
    }.to raise_error "Rate must be a positive integer"
  end

  it 'should accept proper values when creating a new pay schedule' do
    @ps = PaySchedule.new(start_time: 5, end_time: 6, rate: 20)
    expect([@ps.start_time, @ps.end_time, @ps.rate]).to eq([5, 6, 20])
  end
end