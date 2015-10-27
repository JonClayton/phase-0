# Pad an Array

# I worked on this challenge with: Tal Schwartz

# I spent 2 hours on this challenge.


# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.



# 0. Pseudocode

# What is the input?
# An array and a minimum size and optional argument of padding object

# What is the output? (i.e. What should the code return?)
# An array (might be the same array) with padding added to the minimum length if necessary

# What are the steps needed to solve the problem?
# Determine the length of array
# compare length to minimum required
# Create a loop equal to number of added elements required
# run loop appending element each time
# return new array in non-destructive and destructive formats

# we realized when we started writing the loop that a while loop could 
# internalize the length comparison

# 1. Initial Solution

def initial_pad!(array, min_size, value = nil) #destructive
  while array.length < min_size do
    array << value
  end
  return array
end

def initial_pad(array, min_size, value = nil) #non-destructive
  new_array = [] + array
  while new_array.length < min_size do
    new_array << value
  end
  return new_array
end

# 3. Refactored Solution

def pad!(array, min_size, value = nil) #destructive
  array.fill(value,array.length,min_size-array.length)
end

def pad(array, min_size, value = nil) #non-destructive
  Array.new(array).fill(value,array.length,min_size-array.length)
end

=begin
 4. Reflection

##Were you successful in breaking the problem down into small steps?
We were very successful in doing this.  Tiny little steps.

##Once you had written your pseudocode, were you able to easily translate it
##into code? What difficulties and successes did you have?
We translated it into code quite easily, although we didn't really know how 
to capture the distinction between "return the result non-destructively" 
and "return the result destructively"

##Was your initial solution successful at passing the tests? 
##If so, why do you think that is? 
##If not, what were the errors you encountered and what did you do to resolve them?
We did this in Coderpad so we had to make our own tests, but we passed the first
time on destructive and then had to fiddle to get non-destructive results.

##When you refactored, did you find any existing methods in Ruby to clean up your code?
Yes, #fill worked wonders, and #new was a way to avoid a destructive return.

##How readable is your solution? 
##Did you and your pair choose descriptive variable names?
Our intial solution reads quite a bit like Enlish, though the only
new variable we used was `new` for a new array and that could have
been longer and more descriptive, and in fact "new" is a problematic 
variable name anyway so I've changed it. The variables given in the
`def` of the method were not very descriptive either.

##What is the difference between destructive and non-destructive 
##methods in your own words?
Destructive methods assign a new value to the underlying variable. 
Non-destructive methods use that variable as an input but leave its 
value alone, assigning the resulting value to a new variable if it 
is assigned at all.
=end