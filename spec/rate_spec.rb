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

  it 'should give an error if an invalid start_time' do
    invalid_start_times = [0, 4, 13]
    invalid_start_times.each do |invalid_start_time|
      expect {
        @rate.start_time = invalid_start_time
      }.to raise_error "Start time must be after 5 pm and no later than 3 am"
    end
  end

  it 'should be able to set an end time' do
    @rate.end_time = 6
    expect(@rate.end_time).to be(6)
  end

  it 'should give an error if an invalid end_time' do
    invalid_end_times = [5, 0, 13]
    invalid_end_times.each do |invalid_end_time|
      expect {
        @rate.end_time = invalid_end_time
      }.to raise_error "End time must be after 6 pm and no later than 4 am"
    end
  end
end