require './train.rb'

# CargoTrain docs
class CargoTrain < Train

  include Validation
  extend Accessors

  attr_reader :type

  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super(number, :cargo)
  end
end
