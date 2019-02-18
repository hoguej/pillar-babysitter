require_relative 'spec_helper'

describe Family do
  it "should create a new family" do
    @family = Family.new
    expect(@family).to be_a(Family)
  end

  it "should be able to add a pay_plan to family" do
    @family = Family.new
    @family.pay_plan = PayPlan.new
    expect(@family.pay_plan).to be_a(PayPlan)
  end

  it "should be able to set a name on family" do
    @family = Family.new
    @family.name = 'testname'
    expect(@family.name).to eq('testname')
  end

  it "should let me set properties on init" do
    pay_plan = PayPlan.new
    f = Family.new(name: "test name", pay_plan: pay_plan)
    expect([f.name, f.pay_plan]).to eq(["test name", pay_plan])
  end
end