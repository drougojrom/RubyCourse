@groceries = Hash.new

def fill_the_item(name)
  item = {}
  puts "What is the price for 1 item?"
  price = gets.to_f
  puts "How many item did you select?"
  numer_of_items = gets.to_i
  @groceries[name] = {price: price, number_of_items: numer_of_items}
end

def get_all_your_cart_items
  puts "You cart has: "
  @groceries.each do |k, v|
    puts k
    puts "You've taken #{v[:number_of_items]} of them and each one costs #{v[:price]}"
  end
end

def get_every_item_total_price
  total_value = 0
  @groceries.each do |k, v|
    puts "Your item name is #{k}"
    item_value = v[:price] * v[:number_of_items]
    total_value += item_value
    puts "The value of selected item is #{item_value}"
  end
  puts "The total value of all items is #{total_value}"
end

while true
  puts "Enter the name of your item"
  name = gets.chomp.downcase
  if name == "stop"
    get_all_your_cart_items
    get_every_item_total_price
    break
  else
    fill_the_item(name)
  end
end
