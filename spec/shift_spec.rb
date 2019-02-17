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
      }.to raise_error HourOutOfExpectedRangeError
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
      }.to raise_error HourOutOfExpectedRangeError
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

  it 'should tell me that the last hour isnt included' do
    @shift.start_time = 5
    @shift.end_time = 7
    expect(@shift.include?(7)).to be false
  end

  it 'should be able to set params in init' do
    s = Shift.new(start_time: 5, end_time: 8)
    expect([s.start_time, s.end_time]).to eq([5, 8])
  end

  it 'should tell me if two shifts overlap' do
    shift1 = Shift.new(start_time: 5, end_time: 8)
    shift2 = Shift.new(start_time: 6, end_time: 10)
    expect(shift1.overlaps?(shift2)).to be(true)
  end

  it 'should tell me if two shifts dont overlap' do
    shift1 = Shift.new(start_time: 5, end_time: 8)
    shift2 = Shift.new(start_time: 9, end_time: 12)
    expect(shift1.overlaps?(shift2)).to be(false)
  end

  it 'should tell me that two shifts dont overlap if they only share a border time' do
    shift1 = Shift.new(start_time: 5, end_time: 8)
    shift2 = Shift.new(start_time: 8, end_time: 12)
    expect(shift1.overlaps?(shift2)).to be(false)
  end
end