class Station

  def initialize(name)
    @name = name
    @trains = Array.new
  end

  def accept_train(train)
    @trains << train
  end

  def trains_list
    @trains
  end

  def trains_list_typed(type)
    @trains.select { |train| train.type == type }
  end

  def send_train
    @trains.pop
  end
end
