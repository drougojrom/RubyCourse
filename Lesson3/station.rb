class Station

  attr_accessor :trains

  def initialize(name)
    @name = name
  end

  def accept_train(train)
    @trains << train
  end

  def trains_list
    @trains
  end

  def trains_list_typed
  end

  def send_train
    @trains.pop
  end
end
