require './train.rb'

# CargoTrain docs
class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    super(number, :cargo)
  end
end
