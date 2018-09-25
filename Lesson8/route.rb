class Route
  include InstanceCounter

  attr_reader :start_station, :end_station

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

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    raise ArgumentError, "Start station can't be nil" if @start_station.nil?
    raise ArgumentError, "End station can't be nil" if @end_station.nil?

    @stations.each do |station|
      unless station.instance_of? Station
        raise ArgumentError, 'Should contain only stations'
      end
    end
  end
end
