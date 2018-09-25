require './producer_company.rb'

# Wagon docs
class Wagon
  include ProducerCompany

  attr_reader :type
end
