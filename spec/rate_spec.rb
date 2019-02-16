require_relative 'spec_helper'

describe Rate do
  it 'should create a new Rate object' do
    @rate = Rate.new
    expect(@rate).to be_a(Rate)
  end
end