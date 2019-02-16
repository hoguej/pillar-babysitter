require_relative 'spec_helper'

describe Rate do
  before(:each) do 
    @rate = Rate.new
  end

  it 'should create a new Rate object' do
    expect(@rate).to be_a(Rate)
  end

  it 'should be able to set a start time' do
    @rate.start_time = 5
    expect(@rate.start_time).to be(5)
  end

  it 'should give an error if start_time is less than 1' do
    # 5-12, 1-3
    expect {
      @rate.start_time = 0
    }.to raise_error 'Start time must be above 1'
  end
end