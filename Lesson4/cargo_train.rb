require './train.rb'

class CargoTrain < Train

  attr_reader :type

  def initialize(number)
    @type = :cargo
    @number = number
    @speed = 0
    @wagons = Array.new
  end

  def add_wagon(wagon)
    if wagon.type == @type
      @wagons << wagon
    else
      puts "This train has a different type"
    end
  end
end
