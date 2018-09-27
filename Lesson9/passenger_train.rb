require './train.rb'

# PassengerTrain docs
class PassengerTrain < Train

  include Validation
  extend Accessors

  attr_reader :type

  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super(number, :pass)
  end
end
