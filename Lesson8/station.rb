require './instance_counter.rb'

class Station
  include InstanceCounter

  attr_reader :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  attr_reader :name

  def accept_train(train)
    @trains << train
  end

  def trains_list
    @trains.each do |train|
      yield(train)
    end
  end

  def trains_list_typed(type)
    @trains.select { |train| train.type == type }
  end

  def send_train
    @trains.pop
  end

  private

  def validate!
    raise ArgumentError, "Name can't be nil!" if @name.empty?
  end
end
