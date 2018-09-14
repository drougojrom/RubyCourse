class PassengerTrain < Train

  def initialize(number)
    @type = :pass
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

  private
  # we don't have to give a direct acceess to train's type
  attr_reader :type
end
