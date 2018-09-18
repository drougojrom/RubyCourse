require './train.rb'

class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    super(number, 0, [], :cargo)
  end
end
