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
    @@stations << self
    register_instance
  end

  def name
    @name
  end

  def accept_train(train)
    @trains << train
  end

  def trains_list
    @trains
  end

  def trains_list_typed(type)
    @trains.select { |train| train.type == type }
  end

  def send_train
    @trains.pop
  end
end
