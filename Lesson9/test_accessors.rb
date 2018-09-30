require 'accessors.rb'

class TestAccessors
  include Accessors

  attr_accessor_with_history :one, :two
end

test = TestAccessors.new
test.one = "2"
test.one = "1"
test.one
puts test.one_history

