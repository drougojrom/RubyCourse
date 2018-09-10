class Triangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def type
    check_right_angle
    if [@a, @b, @c].sort.uniq.size == 2
      puts "The triangle is isosceles"
    end
  end

  private

  def check_right_angle
    if (@c * @c) == ((@a * @a) + (@b * @b))
      puts "Has right angle"
    else
      puts "Does't have a right angle"
    end
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
triangle.type
