require_relative 'spec_helper'

describe BabySitter do
  it 'should be able create a new baby sitter' do
    @baby_sitter = BabySitter.new
    expect(@baby_sitter).to be_a(BabySitter)
  end

  # it 'should calculate payment for a shift' do
  #   # Family A pays $15 per hour before 11pm, and $20 per hour the rest of the night
  #   family = Family.new
  #   family.pay_plan = PayPlan.new
  #   family.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 5, end_time: 11, rate: 15))
  #   family.pay_plan.add_pay_schedule(PaySchedule.new(start_time: 11, end_time: 4, rate: 20))
    
  #   shift = Shift.new(start_time: 10, end_time: 12)
  #   pay_for_shift = BabySitter.new.calculate_pay_for_shift(family: family, shift: shift)
  #   expect(pay_for_shift).to eq(35)
  # end
end