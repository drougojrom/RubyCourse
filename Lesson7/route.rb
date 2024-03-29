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

  def valid?
    begin
      validate!
      true
    rescue
      false
    end
  end

  private
  def validate!
    raise ArgumentError.new("Start station can't be nil") if @start_station.nil?
    raise ArgumentError.new("End station can't be nil") if @end_station.nil?
    @stations.each do |station|
      if !station.instance_of? Station
        raise ArgumentError.new("Should contain only stations")
      end
    end
  end
end
