class CargoWagon

  attr_reader :type

  def initialize
    @type = :cargo
  end

  private
  attr_writer :type
end
