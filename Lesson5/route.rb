class Route

  include InstanceCounter

  @@instances = 0

  def self.instances
    @@instances
  end

  def self.register_instance
    @@instances += 1
  end

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = []
    @stations << @start_station
    @stations << @end_station
    send :register_instance
  end

  def add_station(station, index)
    if index != 0 && index < @stations.length
      @stations.insert(index, station)
    end
  end

  def remove_station(index)
    if index != 0 && index < @stations.length
      @stations.delete_at(index)
    end
  end

  def get_stations_list
    @stations
  end
end
