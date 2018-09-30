require './station.rb'
require './route.rb'
require './producer_company.rb'
require './acсessors.rb'
require './validation.rb'

# Train docs
class Train
  include ProducerCompany
  include InstanceCounter
  include Validation
  extend Accessors

  @@trains = []

  attr_accessor :route, :current_station, :wagons
  attr_reader :type, :number

  NUMBER_FORMAT = /([a-zA-Z]|[0-9]){3}+(-?)+([a-zA-Z]|[0-9]){2}\b/

  validate :number, :format, NUMBER_FORMAT
  validate :speed, :i_type, Integer

  def self.find(number)
    @@trains.select { |train| train.number == number }.first
  end

  def initialize(number, type)
    @number = number
    @speed = 0
    @wagons = []
    @type = type
    validate!
    @@trains << self
    register_instance
  end

  def increase_speed(speed)
    @speed += speed
    @speed = 0 if @speed < 0
  end

  def stop
    @speed = 0
  end

  def remove_wagon
    @wagons.pop
  end

  def wagons_length
    @wagons.length
  end

  def wagons_list
    @wagons.each do |wagon|
      yield(wagon)
    end
  end

  def add_route(route)
    @route = route
    stations_list.first.accept_train(self)
    @current_station = stations_list.first
  end

  def add_wagon(wagon)
    if wagon.type == @type
      @wagons << wagon
    else
      puts 'This train has a different type'
    end
  end

  def move_forward
    index = stations_list.index(@current_station)
    @current_station.send_train
    @current_station = nil
    return unless (@current_station = stations_list[index + 1])

    @current_station.accept_train(self)
  end

  def move_backwards
    index = stations_list.index(@current_station)
    @current_station.send_train
    return unless (@current_station = stations_list[index - 1])

    @current_station.accept_train(self)
  end

  def next_station
    index = stations_list.index(@current_station)
    next_station = stations_list[index + 1]
    return 'This is the last station' unless next_station

    next_station
  end

  def previous_station
    index = stations_list.index(@current_station)
    prev_station = stations_list[index - 1]
    if prev_station != stations_list.last
      prev_station
    else
      'This is the first station'
    end
  end

  private

  attr_writer :number

  # shortcut for repeating call, dont't need to call ourselves
  def stations_list
    @route.stations_list
  end
end
