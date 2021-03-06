# Largest Integer

# I worked on this challenge by myself.

# largest_integer is a method that takes an array of integers as its input
# and returns the largest integer in the array
#
# +list_of_nums+ is an array of integers
# largest_integer(list_of_nums) should return the largest integer in the +list_of_nums+
#
# If +list_of_nums+ is empty the method should return nil

# Your Solution Below
def largest_integer(list_of_nums)
	method = 3
	case method
	when 1
		list_of_nums.max #This is the short way
	when 2
		largest = list_of_nums[0]
  		list_of_nums.each do |element|
  			largest = element if element > largest
  		end
  		return largest
  	when 3
  		largest = list_of_nums[0]
  		for element in list_of_nums
  			largest = element if element > largest
  		end
  		return largest
  	end
end