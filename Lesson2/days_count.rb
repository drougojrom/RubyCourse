class DateCounter

  def initialize(day, month, year)
    @day = day
    @month = month
    @year = year
  end

  def get_date_counter
    month_range = (1..@month)
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

  private
  
  def fill_hash(year, month_range)
    hash = {}
    puts month_range
    1.upto(month_range.last) do |month|
      hash[month] = days_in_month(year, month)
    end
    hash
  end

  def days_in_month(year, month)
    if is_leap?(year) && month == 2
      28
    elsif month % 2 == 0
      30
    else
      31
    end
  end

  def is_leap?(year)
    return false unless year % 4 == 0
    return true unless year % 100 == 0
    year % 400 == 0
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
