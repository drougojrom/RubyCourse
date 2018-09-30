require './instance_counter.rb'
require './acсessors.rb'
require './validation.rb'

# Station docs
class Station
  include InstanceCounter
  include Validation
  extend Accessors

  attr_reader :name, :trains

  validate :name, :presence
  validate :name, :i_type, String

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
end
