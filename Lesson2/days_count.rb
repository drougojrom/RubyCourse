def get_date_counter(day, month, year)
  @months[2] += 1 if is_leap?(year)
  @months[0...month].sum + day
end

def is_leap?(year)
  return false unless year % 4 == 0
  return true unless year % 100 == 0
  year % 400 == 0
end

@months = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Enter the days value"
day = gets.to_i
puts "Enter the months value"
month = gets.to_i
puts "Enter the years value"
year = gets.to_i

puts "The selected day number is #{get_date_counter(day, month, year)}"
