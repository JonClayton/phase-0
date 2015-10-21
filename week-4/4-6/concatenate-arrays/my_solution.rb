# Concatenate Two Arrays

# I worked on this challenge by myself.


# Your Solution Below

def array_concat(array_1, array_2)
#	array_1+array_2 The easiest way
#	array_1.concat(array_2) Another easy way
  array_new = []
  array_1.each {|element| array_new[array_new.size] = element}
  array_2.each {|element| array_new[array_new.size] = element}
  return array_new
end
