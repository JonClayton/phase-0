# Shortest String

# I worked on this challenge by myself.

# shortest_string is a method that takes an array of strings as its input
# and returns the shortest string
#
# +list_of_words+ is an array of strings
# shortest_string(array) should return the shortest string in the +list_of_words+
#
# If +list_of_words+ is empty the method should return nil

#Your Solution Below
def shortest_string(list_of_words)
	method = 1
	case method
	when 1
		list_of_words.min_by {|x| x.size} #The easy way
	when 2
		shortest = list_of_words[0]
  		list_of_words.each do |element|
  			shortest = element if element.size < shortest.size
  		end
  		return shortest
  	when 3
  		shortest = list_of_words[0]
  		for element in list_of_words
  			shortest = element if element.size < shortest.size
  		end
  		return shortest
  	end
end