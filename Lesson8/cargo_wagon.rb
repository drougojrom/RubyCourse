require './wagon.rb'

class CargoWagon < Wagon
  attr_accessor :taken_space
  attr_reader :free_space

  def initialize(space)
    @type = :cargo
    @free_space = space
    @taken_space = 0
  end

  def take_space(amount)
    @taken_space += amount
    @taken_space = @free_space if @taken_space >= @free_space
  end

  def space_left
    @free_space - @taken_space
  end

  private

  attr_writer :free_space
end
