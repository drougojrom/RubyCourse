def get_fibo
  array = [0, 1]
  i = 2
  loop do
    current_last = array[i - 2] + array[i - 1]
    current_last <= 100 ? array << current_last : break
    i+= 1
  end
  array
end

puts get_fibo
