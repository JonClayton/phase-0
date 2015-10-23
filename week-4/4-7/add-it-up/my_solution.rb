=begin
Add it up!

Complete each step below according to the challenge directions and
include it in this file. Also make sure everything that isn't code
is commented in the file.

I worked on this challenge [by myself, with: ].

1. total Pseudocode
make sure all pseudocode is commented out!

Input:
Output:
Steps to solve the problem.

2. total initial solution
=end
def i_total(array)
	total=0
	array.each {|x| total+=x}
	return total
end

# 3. total refactored solution
def total(array)
	array.inject {|sum, x| sum+=x}
end

=begin
4. sentence_maker pseudocode
make sure all pseudocode is commented out!
Input:
Output:
Steps to solve the problem.


5. sentence_maker initial solution
=end
def i_sentence_maker(array)
	sentence = array.slice!(0).capitalize
	array.each {|word| sentence += " " + word.to_s}
	sentence += "."
	return sentence
end

# 6. sentence_maker refactored solution
def sentence_maker(array)
	array.join(" ").capitalize+"."
end
