require './train.rb'

class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    @type = :pass
    @number = number
    @speed = 0
    @wagons = []
  end
end
