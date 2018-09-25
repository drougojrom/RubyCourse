require './producer_company.rb'

class Wagon
  include ProducerCompany

  attr_reader :type
end
