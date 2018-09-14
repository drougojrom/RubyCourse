require './cargo_wagon.rb'
require './cargo_train.rb'
require './passenger_wagon.rb'
require './passenger_train.rb'

while true
  puts "What do you want to add?"
  input = gets.chomp.downcase

  case input
  when "train"
    puts "train"
  else
    puts "Wow"
  end
end
