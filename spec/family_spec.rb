require_relative 'spec_helper'

describe Family do
  it "should create a new family" do
    @family = Family.new
    expect(@family).to be_a(Family)
  end
end