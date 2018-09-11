require "date"

def fill_hash(year = 2018, months = (1..12))
  hash = {}
  1.upto(months.last) do |month|
    hash[month] = days_in_month(year, month)
  end
  hash
end

def days_in_month(year, month)
  Date.new(year, month, -1).day
end
