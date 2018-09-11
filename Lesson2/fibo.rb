def get_fibo
  array = [0, 1]
  for i in 2..20
    current_last = array[i - 2] + array[i - 1]
    current_last <= 100 ? array << current_last : break
  end
  array
end

puts get_fibo
