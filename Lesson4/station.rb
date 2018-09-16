class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def name
    @name
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
