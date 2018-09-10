# funny task, took me some time to figure it out :)

def get_fibo
  array = []
  for i in 0..99
    array[i] = i
  end
  array[0] = 0
  array[1] = 1
  for i in 2..99
    array[i] = array[i - 1] + array[i - 2]
  end
  array
end

puts get_fibo
