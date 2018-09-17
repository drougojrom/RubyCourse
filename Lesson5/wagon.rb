require './producer_company.rb'

class Wagon

  include ProducerCompany

  attr_reader :type

  def type
    @type
  end
end
