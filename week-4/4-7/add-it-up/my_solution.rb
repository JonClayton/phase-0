=begin
Add it up!

Complete each step below according to the challenge directions and
include it in this file. Also make sure everything that isn't code
is commented in the file.

I worked on this challenge with Josh Monzon.

0. total Pseudocode
make sure all pseudocode is commented out!

Input:  an array of numbers
Output: an integer that is the sum of all the number in the input
Steps to solve the problem.
Take the first number
Add the next number
repeat until all numbers used
return the sum


1. total initial solution
def total(array)
  sum = 0
  array.each do |x|
  sum += x
  end
  return sum
end

3. total refactored solution
=end
def total(array)
p  array.inject{|y, x| y+x}
end
=begin
4. sentence_maker pseudocode
make sure all pseudocode is commented out!
Input: an array of words
Output: a string that is sentence formed form those word
Steps to solve the problem.

Get the first word
Capitalize the first word
put in a space
add the next word
repeat that until we run out of words
put in a period
return the sentence

5. sentence_maker initial solution
def sentence_maker(array)
  sentence = array.slice(0).capitalize
  sentence + " "
  array.each {|word| sentence + word}
  sentence + "."
  p sentence

# 6. sentence_maker refactored solution
=end
def sentence_maker(array)
	array.join(" ").capitalize+"."
end