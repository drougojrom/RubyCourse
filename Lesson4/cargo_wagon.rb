class CargoWagon

  attr_reader :type

  def initialize
    @type = :cargo
  end

  def type
    @type
  end

  private
  attr_writer :type
end
