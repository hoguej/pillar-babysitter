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
end