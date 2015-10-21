# Count Between

# I worked on this challenge by myself.

# count_between is a method with three arguments:
#   1. An array of integers
#   2. An integer lower bound
#   3. An integer upper bound
#
# It returns the number of integers in the array between the lower and upper bounds,
# including (potentially) those bounds.
#
# If +array+ is empty the method should return 0

# Your Solution Below

def count_between(list_of_integers, lower_bound, upper_bound)
#  list_of_integers.count {|x| (x>=lower_bound && x<=upper_bound)}  #Easy one line approach
  count = 0
  list_of_integers.each {|element| count+=1 if (element>=lower_bound && element<=upper_bound)}
  return count
end