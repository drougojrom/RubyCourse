require_relative 'square_helper'

class Quadratic
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def calculate_quadratic
    d = calculate_d
    puts "The value of d is #{d}"
    if d >= 0
      calculate_roots(d)
    else
      puts "There is no roots"
    end
  end

  private

  def calculate_d
    squared(@b) - (4 * @a * @c)
  end

  def calculate_roots(d)
    sqrt_d = Math.sqrt(d)
    divider = (2 * @a)
    if d > 0
      x1 = (-@b + sqrt_d) / divider
      x2 = (-@b - sqrt_d) / divider
      puts "x1 is: #{x1}"
      puts "x2 is: #{x2}"
    elsif d == 0
      x = -@b / divider
      puts "there is only one root: #{x}"
    end
  end
end

puts "Let's define the values"

ask_for_side = "Please, enter the value of the "

puts ask_for_side + "first parameter"
a = gets.to_i

puts ask_for_side + "second parameter"
b = gets.to_i

puts ask_for_side + "third parameter"
c = gets.to_i

q = Quadratic.new(a, b, c)
q.calculate_quadratic
