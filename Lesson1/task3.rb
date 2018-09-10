require_relative 'square_helper'
require_relative 'array_helper'

class Triangle
  def initialize(a, b, c)
    @triangle_values = [a, b, c].sort
  end

  def is_right_angled?
    hypotenuse = @triangle_values.last
    side1 = @triangle_values[0]
    side2 = @triangle_values[1]
    squared(hypotenuse) == (squared(side1) + squared(side2))
  end

  def is_isosceles?
    @triangle_values.uniq.size == 2
  end

  def is_equilateral?
    @triangle_values.same_values?
  end
end

puts "Let's define your triangle"

ask_for_side = "Please, enter the value of the "

puts ask_for_side + "first side"
a = gets.to_i

puts ask_for_side + "second side"
b = gets.to_i

puts ask_for_side + "third side"
c = gets.to_i

triangle = Triangle.new(a, b, c)

if triangle.is_right_angled?
  puts "The triangle has a right angle"
else
  puts "The triangle doesn't have a right angle"
end

if triangle.is_isosceles?
  puts "The triangle is isosceles"
else
  puts "The triangle is not isosceles"
end

if triangle.is_equilateral?
  puts "The triangle is equilateral"
else
  puts "The triangle is not equilateral"
end

