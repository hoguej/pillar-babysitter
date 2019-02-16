describe Shift do
  before(:each) do
    @shift = Shift.new
  end
  
  it 'should create a shift object' do
    expect(@shift).to be_a(Shift)
  end
end