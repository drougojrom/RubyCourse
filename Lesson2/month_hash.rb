require "date"

def days_in_month(year = 2018, month)
  Date.new(year, month, -1).day
end

def get_month_name(month)
  Date::MONTHNAMES[month]
end

months = 1..12

hash = Hash.new

for month in months
  hash[month] = days_in_month(month)
end

hash.each do |k, v|
  if v == 30
    puts get_month_name(k)
  end
end
