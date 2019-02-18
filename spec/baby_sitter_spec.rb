require_relative 'spec_helper'

describe BabySitter do
  it "should be able create a new baby sitter" do
    @baby_sitter = BabySitter.new
    expect(@baby_sitter).to be_a(BabySitter)
  end
end