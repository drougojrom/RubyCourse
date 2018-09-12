class Train

  attr_accessor :speed, :route, :current_station, :type

  def initialize(number, type, length)
    @number = number
    @type = type if type == :pass || type == :freight
    @length = length
    @speed = 0
  end

  def increase_speed(speed)
    @speed += speed
    @speed = 0 if @speed < 0
  end

  def stop
    @speed = 0
  end

  def get_length
    @length
  end

  def add_wagon
    @length += 1 if @speed == 0
  end

  def remove_wagon
    @length -= 1 if @speed == 0 && @length > 0
  end

  def set_route(route)
    @route = route
    stations_list.first.accept_train(self)
    @current_station = stations_list.first
  end

  def move_forward
    index = stations_list.index(@current_station)
    @current_station.send_train
    @current_station ||= stations_list[index+1]
    @current_station.accept_train(self)
    check_if_final
  end

  def move_backwards
    index = stations_list.index(@current_station)
    @current_station.send_train
    @current_station ||= stations_list[index-1]
    @current_station.accept_train(self)
  end

  def next_station
    index = stations_list.index(@current_station)
    if next_station = stations_list[index + 1]
      next_station
    else
      "This is the last station"
    end
  end

  def previous_station
    index = stations_list.index(@current_station)
    prev_station = stations_list[index - 1]
    if prev_station != stations_list.last
      prev_station
    else
      "This is the first station"
    end
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
