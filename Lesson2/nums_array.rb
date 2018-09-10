def make_nums_array
  array = []
  (10..100).each do |num|
    if num % 5 == 0
      array << num
    end
  end
  array
end

puts make_nums_array
