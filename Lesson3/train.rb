class Train

  attr_accessor :speed, :route, :current_station

  def initialize(number, type, length)
    @number = number
    @type = type if type == :pass || type == :freight
    @length = length
    @speed = 0
  end

  def increase_speed(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def get_length
    @length
  end

  def add_vagon
    @length += 1 if @speed == 0
  end

  def remove_vagon
    @length -= 1 if @speed == 0
  end

  def set_route(route)
    @route = route
    @current_station = stations_list.first
  end

  def move_forward
    index = @route.get_stations_list.index(@current_station)
    @current_station = stations_list[index+1]
    check_if_final
  end

  def move_backwards
    index = @route.get_stations_list.index(@current_station)
    @current_station ||= stations_list[index-1]
  end

  private

  def check_if_final
    @current_station = stations_list.first if stations_list.last == @current_station
  end

  private

  def stations_list
    @route.get_stations_list
  end
end
