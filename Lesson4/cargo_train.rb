require './train.rb'

class CargoTrain < Train
  def initialize(number)
    @type = :cargo
    @number = number
    @speed = 0
    @wagons = []
  end
end
