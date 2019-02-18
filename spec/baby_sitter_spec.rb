require_relative 'spec_helper'

describe BabySitter do
  before(:each) do
    # Family A pays $15 per hour before 11pm, and $20 per hour the rest of the night
    @familyA = Family.new(name: 'A')
    @familyA.pay_plan = PayPlan.new
    @familyA.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 5, end_time: 11, rate: 15)) # 90 
    @familyA.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 11, end_time: 4, rate: 20)) # 100

    # Family B pays $12 per hour before 10pm, $8 between 10 and 12, and $16 the rest of the night
    @familyB = Family.new(name: 'B')
    @familyB.pay_plan = PayPlan.new
    @familyB.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 5, end_time: 10, rate: 12)) # 60
    @familyB.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 10, end_time: 12, rate: 8)) # 16
    @familyB.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 12, end_time: 4, rate: 16)) # 64 

    # Family C pays $21 per hour before 9pm, then $15 the rest of the night
    @familyC = Family.new(name: 'C')
    @familyC.pay_plan = PayPlan.new
    @familyC.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 5, end_time: 9, rate: 21))
    @familyC.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 9, end_time: 4, rate: 15))
  end

  it 'should be able create a new baby sitter' do
    @baby_sitter = BabySitter.new
    expect(@baby_sitter).to be_a(BabySitter)
  end

  it 'should calculate payment for a shift' do
    shift = Shift.new(start_time: 10, end_time: 12)
    pay_for_shift = BabySitter.new.calculate_pay_for_shift(family: @familyA, shift: shift)
    expect(pay_for_shift).to eq(35)
  end

  it 'should calculate payment for a full shift of FamilyA' do
    shift = Shift.new(start_time: 5, end_time: 4)
    pay_for_shift = BabySitter.new.calculate_pay_for_shift(family: @familyA, shift: shift)
    expect(pay_for_shift).to eq(190)
  end

  it 'should calculate payment for a full shift of FamilyB' do
    shift = Shift.new(start_time: 5, end_time: 4)
    pay_for_shift = BabySitter.new.calculate_pay_for_shift(family: @familyB, shift: shift)
    expect(pay_for_shift).to eq(140)
  end
end
