module TrainType
  PASS_TRAIN = 0
  FREIGHT_TRAIN = 1
end

class Train

  attr_accessor :speed, :route, :current_station

  def initialize(number, type, length)
    @number = number
    @type = type if type.is_a? TrainType
    @length = length
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
    @current_station = @route.first
  end

  def move_forward
    index = @route.index(@current_station)
    @current_station = @route[index+1]
    check_if_final
  end

  def move_backwards
    index = @route.index(@current_station)
    @current_station = @route[index-1]
  end

  private

  def check_if_final
    @current_station = @route.first if @route.last == @current_station
  end
end
