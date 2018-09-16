class Wagon
  attr_reader :type

  def type
    @type
  end

  private
  attr_writer :type
end
