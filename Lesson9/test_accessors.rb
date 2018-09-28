require './accessors.rb'
require 'pry'

class TestAccessors
  include Accessors

  attr_accessor_with_history :one, :two
end

test = TestAccessors.new
test.one = "2"
test.one = "1"
puts test.one_history

