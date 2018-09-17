module ProducerCompany
  attr_reader :name

  def set_producer(name)
    self.name = name
  end

  def get_producer
    self.name
  end

  private
  attr_writer :name
end
