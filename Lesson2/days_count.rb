require_relative 'month_hash'

class DateCounter

  def initialize(day, month, year)
    @day = day
    @month = month
    @year = year
  end

  def get_date_counter
    hash = fill_hash(@year, @month)
    puts hash
  end

  private

  def is_leap?
    return false unless @year % 4 == 0
    return true unless @year % 100 == 0
    @year % 400 == 0
  end
end

d = DateCounter.new(1, 1, 2018)
d.get_date_counter
