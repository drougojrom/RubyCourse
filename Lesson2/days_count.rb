require_relative 'fill_hash_helper'

class DateCounter

  def initialize(day, month, year)
    @day = day
    @month = month
    @year = year
  end

  def get_date_counter
    month_range = 1..@month
    hash = fill_hash(@year, month_range)
    previous_days_count = 0
    hash.each do |k, v|
      if k < @month
        previous_days_count += v
      end
    end

    previous_days_count += @day
    previous_days_count
  end
end

puts "Enter the days value"
day = gets.to_i
puts "Enter the months value"
month = gets.to_i
puts "Enter the years value"
year = gets.to_i

d = DateCounter.new(day, month, year)
puts "The selected day number is #{d.get_date_counter}"
