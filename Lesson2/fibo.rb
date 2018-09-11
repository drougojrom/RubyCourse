# funny task, took me some time to figure it out :)

def get_fibo
  array = [0, 1]
  current_last = array.last
  while current_last <= 100
    last_numbers = array.last(2)
    current_last = last_numbers[1] + last_numbers[0]
    array << current_last unless current_last >= 100
  end
  array
end

puts get_fibo
