require './wagon.rb'

class PassengerWagon < Wagon
  def initialize
    @type = :pass
  end
end
