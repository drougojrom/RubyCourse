class PassengerWagon

  attr_reader :type

  def initialize
    @type = :pass
  end

  def type
    @type
  end

  private
  attr_writer :type
end
