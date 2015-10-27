# Numbers to Commas Solo Challenge
=begin
# I spent 2 hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# 0. Pseudocode

# What is the input?
A positive integer

# What is the output? (i.e. What should the code return?)
A string representing the input integer with properly placed commas

# What are the steps needed to solve the problem?
Convert the input from integer into string class
Convert the string into an array to be easy to work with
Create a variable containing the inserted string ","
Set a variable equal to how many commas are needed (length of number minus 1 divided by three)
Set the inital insert index to -3.
DO a loop as many times as commas are needed, m
  Break the string into two pieces (left part and right part) at the insert point
  Insert the comma by appending it to the left part and then appending the right part
  Make the insert index -4 larger each time we loop
Close the loop
Return the string by joining the array back together

# 1. Initial Solution
=end

def init_separate_comma(number)
	number_string = number.to_s.split("")
	comma = [","]
	comma_count = (number_string.length-1)/3
	insert_point = -3
	comma_count.times do |i|
		right = number_string.slice!(insert_point..-1)
		number_string = number_string + comma + right
		insert_point -= 4
	end
	return number_string.join("")
end

# 2. Refactored Solution
def one_line_separate_comma(number)
	number.to_s.split("").map.with_index{|x,i| x + ((number.to_s.length-i)%3==1 ? "," : "")}.join("")[0..-2]
end 
# I suspect this can be done a bit better with RegEx or something else that would all me to take the digits in

def separate_comma(number)
	number_string = number.to_s
	right = ""
	while number_string.length > 3
		right = "," + number_string.slice!(-3,3) + right
	end
	return number_string + right
end 
# This is a lot cleaner.  The logic in my pseudocode was not the most efficient approach!

=begin

# 3. Reflection

##What was your process for breaking the problem down? 
##What different approaches did you consider?
I started out believing an array was easier to manipulate, and made it 
very messy by reassembling the number after each comma was added
The one-line refactor was quite messy because `#each` required me to work from 
left to right, which is awkward when the proper space for commas is based on 
distance from the right hand side.
My final refactor involved coming up with a way to attack the problem from the right.

##Was your pseudocode effective in helping you build a successful initial solution?
Yes, but it would have worked better if I had worried less about breaking the problem 
into small pieces and more about coming up with the most efficent way to attack the 
problem

##What Ruby method(s) did you use when refactoring your solution? 
To get it on one line I used #split, #map.with_index, #to_s, #to_a, #length, and #join.
In the clearer refactor I used just #to_a, #length and #slice!

##What difficulties did you have implementing it/them? 
It was tricky to come up with the right approach to attack this from the
left hand side and keep the digits in blocks with commas.  I had some 
trouble with the one line solution because I had to accept a stray comma at the end 
and then delete it off.

##Did it/they significantly change the way your code works? If so, how?
Using #map is pretty handy, as it lets you use the current index number
when building the block to decide what you want to map into the variables.
#slice! was very handy once I figured out the right way to approach the logic.

##How did you initially iterate through the data structure?
I used a loop to iterate through it three digits at a time from the right end.
In the single line solution I have to go one digit at a time from left, which makes 
comma placement much, much trickier.

##Do you feel your refactored solution is more readable than your initial solution? Why?
The multiline is much more readable because the logic is simpler and so can easily flow
through the code. The one line solution is pretty hard to parse even for the enthusiast.

=end
