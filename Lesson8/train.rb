require './station.rb'
require './route.rb'
require './producer_company.rb'
require 'pry'

class Train
  include ProducerCompany
  include InstanceCounter

  @@trains = []

  attr_accessor :route, :current_station, :wagons
  attr_reader :type, :number

  NUMBER_FORMAT = /([a-zA-Z]|[0-9]){3}+(-?)+([a-zA-Z]|[0-9]){2}\b/

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

  attr_reader :number

  attr_reader :type

  attr_reader :route

  def get_length
    @wagons.length
  end

  attr_reader :wagons

  def wagons_list
    @wagons.each do |wagon|
      yield(wagon)
    end
  end

  def set_route(route)
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
    if @current_station = stations_list[index + 1]
      @current_station.accept_train(self)
    end
  end

  def move_backwards
    index = stations_list.index(@current_station)
    @current_station.send_train
    if @current_station = stations_list[index - 1]
      @current_station.accept_train(self)
    end
  end

  def next_station
    index = stations_list.index(@current_station)
    if next_station = stations_list[index + 1]
      next_station
    else
      'This is the last station'
    end
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

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  # shortcut for repeating call, dont't need to call ourselves
  def stations_list
    @route.get_stations_list
  end

  def validate!
    raise ArgumentError, 'Number has invalid format' if @number !~ NUMBER_FORMAT
  end
end
