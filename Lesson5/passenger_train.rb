require './train.rb'

class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    super(number, :pass)
  end
end
