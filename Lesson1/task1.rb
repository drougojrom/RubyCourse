puts "What's your name?"
name = gets.chomp
puts "What's your height?"
height = gets.to_i
result = height - 110

if result >= 0
  puts "#{name}, your ideal weight is #{result}"
else
  puts "#{name}, your weight is already ideal"
end
