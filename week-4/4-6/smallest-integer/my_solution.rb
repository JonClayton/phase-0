# Smallest Integer

# I worked on this challenge by myself.

# smallest_integer is a method that takes an array of integers as its input
# and returns the smallest integer in the array
#
# +list_of_nums+ is an array of integers
# smallest_integer(list_of_nums) should return the smallest integer in +list_of_nums+
#
# If +list_of_nums+ is empty the method should return nil

# Your Solution Below
def smallest_integer(list_of_nums)
	method = 4
	case method
	when 1
		list_of_nums.min #the brutally short way
	when 2
		list_of_nums.sort[0] #this would be an easy one line way
	when 3 #if each is okay
		smallest = list_of_nums[0]
  		list_of_nums.each do |element|
  			smallest = element if element < smallest
  		end
  		return smallest
  	when 4 # with no methods
  		smallest = list_of_nums[0]
  		for element in list_of_nums
  			smallest = element if element < smallest
  		end
  		return smallest	
  	end
end