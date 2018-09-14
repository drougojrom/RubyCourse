require './cargo_wagon.rb'
require './cargo_train.rb'
require './passenger_wagon.rb'
require './passenger_train.rb'

@created_trains = Array.new
@created_stations = Array.new
@created_wagons = Array.new
@created_routes = Array.new

def create
  puts "What do you want to create?"
  puts "1 - Create a Train"
  puts "2 - Create a Station"
  puts "3 - Create a Wagon"
  puts "4 - Create a Route"

  input = gets.to_i

  case input
  when 1..4
    create_for(input)
  else
    puts "Invalid input"
  end
end

def show_stations
  index = 1
  @created_stations.each do |station|
    puts "#{index} - #{station.name}"
    index += 1
  end
end

def show_trains
  index = 1
  @created_trains.each do |train|
    puts "#{index} - #{train.number}"
    index += 1
  end
end

def show_routes
  index = 1
  @created_routes.each do |route|
    puts "#{index} - #{route.get_stations_list}"
  end
end

def show_wagons
  index = 1
  @created_wagons.each do |wagon|
    puts "#{index} - #{wagon}"
  end
end

def create_for(input)
  case input
  when 1
    puts "What's your train number?"
    number = gets.to_i
    puts "What's your train type? Select 1 for pass and 2 for cargo"
    type = gets.to_i
    @train = type == 1 ? PassengerTrain.new(number) : CargoTrain.new(number)
    @created_trains << @train
    puts "You've created a new train with id: #{@train.object_id}"
  when 2
    puts "What's the name of your station?"
    name = gets.chomp
    @station = Station.new name
    @created_stations << @station
    puts "You've created a new station with id: #{@station.object_id}"
  when 3
    puts "Which type of wagon do you want to create? Select 1 for pass and 2 for cargo"
    type = gets.to_i
    @wagon = type == 1 ? PassengerWagon.new : CargoWagon.new
    @created_wagons << @wagon
    puts "You've created a new wagon with id: #{@wagon.object_id}"
  when 4
    puts "In order to create a route, please select its start"
    show_stations
    start_index = gets.to_i
    start_station = @created_stations[start_index - 1]
    puts "You also need to choose its end station"
    show_stations
    end_index = gets.to_i
    end_station = @created_stations[end_index - 1]
    if start_station == end_station
      puts "You've selected the same station twice"
      return
    else
      @route = Route.new start_station, end_station
      @created_routes << @route
      puts "You've created a new route with id: #{@route.object_id}"
    end
  else
    puts "wow"
  end
end

def add_for(input)
  case input
  when 1
    puts "Select a route"
    show_routes
    route_index = gets.to_i - 1
    route = @created_routes[route_index]
    available_stations = @created_stations.select {|station| !route.get_stations_list.include? station }
    if available_stations.length == 0
      puts "All created stations are already included into the route"
    else
      puts "Select a station"
      index = 1
      available_stations.each do |station|
        puts "#{index} - #{station.name}"
        index += 1
      end
      selected_index = gets.to_i
      selected_station = available_stations[selected_index - 1]
      @created_routes[route_index].add_station(selected_station,
                                               @created_routes[route_index].get_stations_list.length - 1)
      puts "Route updated!"
    end
  when 2
  when 3
  else
    puts "Invalid input"
  end
end


def add
  puts "What do you want to add?"
  puts "1 - Station to Route"
  puts "2 - Wagon to train"
  puts "3 - Route to train"
  input = gets.to_i
  add_for(input)
end

def move
end

def show
  puts '1 - Stations, 2 - Trains, 3 - Wagons, 4 - Routes'
  input = gets.to_i
  case input
  when 1
    show_stations
  when 2
    show_trains
  when 3
    show_wagons
  when 4
    show_routes
  else
    puts "Invalid input"
  end
end

while true
  puts "What do you want to do?"
  puts "1 - Create Train/Station/Route/Wagon"
  puts "2 - Add Stations to Routes, wagons to trains, Routes to trains"
  puts "3 - Move train"
  puts "4 - Show list of stations or trains for routes"
  puts "5 - quit"

  input = gets.to_i

  case input
  when 1
    create
  when 2
    add
  when 3
    move
  when 4
    show
  when 5
    break
  else
    puts "Invalid input"
  end
end