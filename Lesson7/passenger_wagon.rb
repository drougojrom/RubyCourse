require './wagon.rb'

class PassengerWagon < Wagon
  attr_accessor :taken_seats

  def initialize(seats)
    @type = :pass
    @free_seats = seats
    @taken_seats = 0
  end

  def take_seat
    @taken_seats += 1
    @taken_seats = @free_seats if @taken_seats >= @free_seats
  end

  def seats_left
    @free_seats - @taken_seats
  end

  private

  attr_writer :free_seats
end
