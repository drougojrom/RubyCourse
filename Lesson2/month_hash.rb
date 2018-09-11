require "date"
require_relative "fill_hash_helper"

def get_month_name(month)
  Date::MONTHNAMES[month]
end

hash = fill_hash

hash.each do |k, v|
  if v == 30
    puts get_month_name(k)
  end
end
