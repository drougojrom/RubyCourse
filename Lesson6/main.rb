require './cargo_wagon.rb'
require './cargo_train.rb'
require './passenger_wagon.rb'
require './passenger_train.rb'
require './instance_counter.rb'

@created_trains = []
@created_stations = []
@created_wagons = []
@created_routes = []

def remove_train
  puts "Select a train"
  show_trains
  index = gets.to_i - 1
  if @created_trains[index]
    @created_trains[index].remove_wagon
    puts "Wagon removed"
  end
end

def remove_station
  puts "Select a route"
  show_routes
  route_index = gets.to_i - 1
  index = 1
  if @created_routes[route_index]
    puts "Select a station which you want to remove"
    @created_routes[route_index].get_stations_list.each do |station|
      if station.trains_list.length == 0
        puts "#{index} - #{station.name}"
        index += 1
      end
    end
    selected_station_index = gets.to_i - 1
    if @created_routes[route_index].remove_station(selected_station_index)
      puts "The station was removed from the route"
    end
  end
end


def remove
  puts "What do you want to remove? 1 - wagon from train, 2 - Station from a route"
  action_index = gets.to_i
  case action_index
  when 1
    remove_train
  when 2
    remove_station
  else
    puts "Wrong input"
  end
end

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

def show_stations(include_trains = false, train_type = :pass)
  index = 1
  @created_stations.each do |station|
    puts "#{index} - #{station.name}"
    puts "#{station.trains_list_typed(train_type)}"
    index += 1
  end
end

def show_trains
  index = 1
  @created_trains.each do |train|
    puts "#{index} - Train#{train.type}:#{train.number}"
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

def create_train
  puts "What's your train number?"
  number = gets.to_s
  puts "What's your train type? Select 1 for pass and 2 for cargo"
  type = gets.to_i
  case type
  when 1
    @train = PassengerTrain.new(number)
  when 2
    @train = CargoTrain.new(number)
  else
    puts "The train with no type can't be created"
    return
  end
  if @train.valid?
    @created_trains << @train
    puts "You've created a new train with number: #{@train.number}"
  end
end

def create_station
  puts "What's the name of your station?"
  name = gets.chomp
  @station = Station.new name
  @created_stations << @station
  puts "You've created a new station with id: #{@station.object_id}"
end

def create_wagon
  puts "Which type of wagon do you want to create? Select 1 for pass and 2 for cargo"
  type = gets.to_i
  case type
  when 1
    @wagon = PassengerWagon.new
  when 2
    @wagon = CargoWagon.new
  else
    puts "Invalid wagon type"
    return
  end
  @created_wagons << @wagon
  puts "You've created a new wagon with id: #{@wagon.object_id}"
end

def create_route
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
    if @route.valid?
      @created_routes << @route
      puts "You've created a new route with id: #{@route.object_id}"
    end
  end
end

def create_for(input)
  case input
  when 1
    create_train
  when 2
    create_station
  when 3
    create_wagon
  when 4
    create_route
  end
end

def add_station_to_route
  puts "Select a route"
  show_routes
  route_index = gets.to_i - 1
  if route = @created_routes[route_index]
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
  else
    puts "There is no routes"
  end
end

def add_wagon_to_train
  puts "Select a train"
  show_trains
  train_index = gets.to_i - 1
  if train = @created_trains[train_index]
    puts "Select a wagon"
    if available_wagons = @created_wagons.select { |wagon| wagon.type == train.type }
      filtered_wagons = available_wagons.select { |wagon| !train.wagons.include? wagon}
      index = 1
      filtered_wagons.each do |wagon|
        puts "#{index} - #{wagon}"
        index += 1
      end
      selected_index = gets.to_i - 1
      selected_wagon = filtered_wagons[selected_index]
      if @created_trains[train_index].add_wagon(selected_wagon)
        puts "Wagon added to train #{@created_trains[train_index].wagons}"
      end
    else
      puts "There is no trains"
    end
  end
end

def add_route_to_train
  puts "Select a route"
  show_routes
  route_index = gets.to_i - 1
  if selected_route = @created_routes[route_index]
    puts "Select a train for that route"
    available_trains = @created_trains.select { |created_train| created_train.route != selected_route }
    index = 1
    available_trains.each do |available_train|
      puts "#{index} - #{available_train}"
      index += 1
    end
    selected_available_train_index = gets.to_i - 1
    selected_available_train = available_trains[selected_available_train_index]
    if @created_trains[selected_available_train_index].set_route(selected_route)
      puts "Route #{selected_route}, added for a train #{selected_available_train}"
    end
  else
    puts "There is no routes"
  end
end

def add_for(input)
  case input
  when 1
    add_station_to_route
  when 2
    add_wagon_to_train
  when 3
    add_route_to_train
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
  puts "Select a train which you want to move"
  show_trains
  selected_train_index = gets.to_i - 1
  puts "Do you want to move it forward or backward? 1 - forward, 2 - backward"
  selected_action = gets.to_i
  case selected_action
  when 1
    if @created_trains[selected_train_index].move_forward
      puts "Selected train moved forward"
    else
      puts "no"
    end
  when 2
    if @created_trains[selected_train_index].move_backwards
      puts "Selected train moved backward"
    end
  end
end

def show
  puts '1 - Stations, 2 - Trains, 3 - Wagons, 4 - Routes'
  input = gets.to_i
  case input
  when 1
    puts "Which type of trains do you want to see? 1 - pass, 2 - cargo"
    type = gets.to_i == 1 ? :pass : :cargo
    show_stations(true, type)
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
  puts "3 - Remove station from Route/wagon from train"
  puts "4 - Move train"
  puts "5 - Show list of stations or trains for routes"
  puts "6 - quit"
  input = gets.to_i
  case input
  when 1
    create
  when 2
    add
  when 3
    remove
  when 4
    move
  when 5
    show
  when 6
    break
  else
    puts "Invalid input"
  end
end
