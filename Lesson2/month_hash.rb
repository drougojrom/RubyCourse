require "date"

def days_in_month(year, month)
  Date.new(year, month, -1).day
end

def get_month_name(month)
  Date::MONTHNAMES[month]
end

def fill_hash(months = (1..12), year = 2018)
  hash = {}
  for month in months
    hash[month] = days_in_month(year, month)
  end
  hash
end

hash = fill_hash

hash.each do |k, v|
  if v == 30
    puts get_month_name(k)
  end
end
