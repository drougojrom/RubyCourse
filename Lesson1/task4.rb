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
    (@b * @b) - (4 * @a * @c)
  end

  def calculate_roots(d)
    if d > 0
      x1 = -@b + (Math.sqrt(d) / 2 * @a)
      x2 = -@b - (Math.sqrt(d) / 2 * @a)
      puts "x1 is: " + x1.to_s
      puts "x2 is: " + x2.to_s
    elsif d == 0
      x = -@b / (2 * @a)
      puts "there is only one root: " + x.to_s
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
