h = {}
("a".."z").each_with_index { |key, value| h[key] = value+1 }
puts h
