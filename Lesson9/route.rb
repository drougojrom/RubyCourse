require './acсessors.rb'
require './validation.rb'

# Route docs
class Route
  include InstanceCounter
  include Validation

  attr_reader :start_station, :end_station

  validate :stations, :contain_only, Station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = []
    @stations << @start_station
    @stations << @end_station
    validate!
    register_instance
  end

  def add_station(station, index)
    @stations.insert(index, station) if index != 0 && index < @stations.length
  end

  def remove_station(index)
    @stations.delete_at(index) if index != 0 && index < @stations.length
  end

  def stations_list
    @stations
  end
end
