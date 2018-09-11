h = {}
vowels = ["a", "e", "i", "o", "u"]
("a".."z").each_with_index { |key, value| h[key] = value+1 if vowels.include? key }
puts h
