# Longest String

# I worked on this challenge by myself.

# longest_string is a method that takes an array of strings as its input
# and returns the longest string
#
# +list_of_words+ is an array of strings
# longest_string(list_of_words) should return the longest string in +list_of_words+
#
# If +list_of_words+ is empty the method should return nil


# Your Solution Below
def longest_string(list_of_words)
	method = 3
	case method
	when 1
		list_of_words.max_by {|x| x.size}  #The easy way
	when 2
		longest = list_of_words[0]
  		list_of_words.each do |element|
  		longest = element if element.size > longest.size
  		end
  		return longest
  	when 3
  		longest = list_of_words[0]
  		for element in list_of_words
  			longest = element if element.size > longest.size
  		end
  		return longest	
  	end
end