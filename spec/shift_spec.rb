describe Shift do
  before(:each) do
    @shift = Shift.new
  end
  
  it 'should create a shift object' do
    expect(@shift).to be_a(Shift)
  end

  it 'should be able to set a start time' do
    @shift.start_time = 5
    expect(@shift.start_time).to be(5)
  end

  it 'should give an error if an invalid start_time' do
    invalid_start_times = [0, 4, 13]
    invalid_start_times.each do |invalid_start_time|
      expect {
        @shift.start_time = invalid_start_time
      }.to raise_error "Start time must be after 5 pm and no later than 3 am"
    end
  end

  it 'should be able to set an end time' do
    @shift.end_time = 6
    expect(@shift.end_time).to be(6)
  end

  it 'should give an error if an invalid end_time' do
    invalid_end_times = [5, 0, 13]
    invalid_end_times.each do |invalid_end_time|
      expect {
        @shift.end_time = invalid_end_time
      }.to raise_error "End time must be after 6 pm and no later than 4 am"
    end
  end

  it 'should tell me if an hour is included in a shift' do
    @shift.start_time = 5
    @shift.end_time = 4
    expect(@shift.include?(6)).to be true
  end

  it 'should tell me if an hour is not included in a shift' do
    @shift.start_time = 5
    @shift.end_time = 7
    expect(@shift.include?(8)).to be false
  end

  it 'should be able to set params in init' do
    s = Shift.new(start_time: 5, end_time: 8)
    expect([s.start_time, s.end_time]).to eq([5, 8])
  end
end