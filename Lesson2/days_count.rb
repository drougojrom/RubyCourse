def get_date_counter(day, month, year)
  previous_days_count = 0
  @months[1] += 1 if is_leap?(year)
  @months.each_with_index do |value, index|
    if index < month
      previous_days_count += value
    end
  end
  previous_days_count += day
  previous_days_count
end

def is_leap?(year)
  return false unless year % 4 == 0
  return true unless year % 100 == 0
  year % 400 == 0
end

@months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Enter the days value"
day = gets.to_i
puts "Enter the months value"
month = gets.to_i
puts "Enter the years value"
year = gets.to_i

puts "The selected day number is #{get_date_counter(day, month-1, year)}"
