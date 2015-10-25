# Concatenate Two Arrays

# I worked on this challenge by myself.


# Your Solution Below

def array_concat(array_1, array_2)
	method = 4
	case method
	when 1
		array_1 + array_2 # The easiest way
	when 2
		array_1.concat(array_2) # Another easy way
	when 3 # a long way
		array_new = []
  		array_1.each {|element| array_new[array_new.size] = element}
  		array_2.each {|element| array_new[array_new.size] = element}
  		return array_new
  	when 4 # Showing an array as a range in a for loop
  		index = 0
  		array_new = []
  		for element in array_1
  			array_new[index] = element
  			index += 1
  		end
  		for element in array_2
  			array_new[index] = element
  			index += 1
  		end
  		return array_new
  	end
end