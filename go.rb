require_relative './lib/pay_schedule'
require_relative './lib/pay_plan'
require_relative './lib/shift'
require_relative './lib/family'
require_relative './lib/baby_sitter'
require_relative './bundle/bundler/setup'

family_data = {
  'A' => [
    {start_time: 5, end_time: 11, rate: 15},
    {start_time: 11, end_time: 4, rate: 20}
  ],
  'B' => [
    {start_time: 5, end_time: 10, rate: 12},
    {start_time: 10, end_time: 12, rate: 8},
    {start_time: 12, end_time: 4, rate: 16}
  ],
  'C' => [
    {start_time: 5, end_time: 9, rate: 21},
    {start_time: 9, end_time: 4, rate: 15}
  ],
  'D' => [
    {start_time: 5, end_time: 6, rate: 10},
    {start_time: 6, end_time: 7, rate: 20},
    {start_time: 7, end_time: 4, rate: 30}
  ],
  'E' => [
    {start_time: 5, end_time: 7, rate: 40},
    {start_time: 7, end_time: 12, rate: 30},
    {start_time: 12, end_time: 1, rate: 20},
    {start_time: 1, end_time: 4, rate: 10}
  ],
  'F' => [
    {start_time: 5, end_time: 4, rate: 10}
  ]
}

shift_data = [
  { start_time: 5, end_time: 6 },
  { start_time: 5, end_time: 12 },
  { start_time: 5, end_time: 4 },
  { start_time: 12, end_time: 1 },
  { start_time: 12, end_time: 4 },
  { start_time: 3, end_time: 4 },
  { start_time: 11, end_time: 1 }
]

families = Family.load(family_data)
shifts = shift_data.map{ |data| Shift.new(data) }

baby_sitter = BabySitter.new
shifts.each do |shift|
  puts "Shift: #{shift.start_time} - #{shift.end_time}"
  families.each do |family|
    pay = baby_sitter.calculate_pay_for_shift(family: family, shift: shift)
    hourly = baby_sitter.last_pay_per_hour.map{ |m| "#{m[:hour]}:$#{m[:rate]}" }.join(" ")
    puts "\t#{family.name} - Total: $#{pay}\tHourly: #{hourly}"
  end
end