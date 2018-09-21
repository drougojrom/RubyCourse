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

  private
  def validate!
    begin
      raise "Name can't be nil!" if !@name.nil?
      true
    rescue
      puts "Invalid name"
      false
    end
  end
end
