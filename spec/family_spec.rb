require_relative 'spec_helper'

describe Family do
  before(:each) do
    @family = Family.new
  end

  it "should create a new family" do
    expect(@family).to be_a(Family)
  end

  it "should be able to add a pay_plan to family" do
    @family.pay_plan = PayPlan.new
    expect(@family.pay_plan).to be_a(PayPlan)
  end

  it "should be able to set a name on family" do
    @family.name = 'testname'
    expect(@family.name).to eq('testname')
  end

  it "should let me set properties on init" do
    pay_plan = PayPlan.new
    f = Family.new(name: "test name", pay_plan: pay_plan)
    expect([f.name, f.pay_plan]).to eq(["test name", pay_plan])
  end

  it "should load a hash of families" do
    families = { 
      "A" => [],
      "B" => [],
      "C" => []
    }
    result_classes = Family.load(families).map{ |family| 
      family.class
    }
    expect(result_classes).to eq([Family, Family, Family])
  end

  it "should load families and pay_schedules on load" do
    families = {
      'A' => [
        {start_time: 5, end_time: 11, rate: 15},
        {start_time: 11, end_time: 4, rate: 20}
      ],
      'B' => [
        {start_time: 5, end_time: 8, rate: 30},
        {start_time: 8, end_time: 4, rate: 40}
      ]
    }
    result = {}
    Family.load(families).each{ |family|
      result[family.name] = family.pay_plan.pay_schedules.map { |ps|
        { start_time: ps.start_time, end_time: ps.end_time, rate: ps.rate }
      }
    }
    expect(result).to eq(families)
  end

  it "should create a pay_plan if none is passed when creating a new family" do
    expect(@family.pay_plan).to be_a(PayPlan)
  end
end
