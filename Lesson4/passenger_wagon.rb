class PassengerWagon

  attr_reader :type

  def initialize
    @type = :pass
  end

  private
  attr_writer :type
end
