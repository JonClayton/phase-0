# Add it up!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge [by myself, with: ].

# 0. total Pseudocode
# make sure all pseudocode is commented out!

# Input:
# Output:
# Steps to solve the problem.


# 1. total initial solution



# 3. total refactored solution



# 4. sentence_maker pseudocode
# make sure all pseudocode is commented out!
# Input:
# Output:
# Steps to solve the problem.


# 5. sentence_maker initial solution



# 6. sentence_maker refactored solution







array_1 = [1, 2, 3, 4, 5, 5, 7]
array_2 = [4, 4, 5, 5, 6, 6, 6, 7]
first_sentence = ["all", "my", "socks", "are", "dirty"]
second_sentence = ["alaska", "has", "over", 586, "thousand", "miles"]

puts "failed array method" unless defined?(total) == 'method'
puts "failed array arguments" unless method(:total).arity ==  1
puts "failed array1 total" unless total(array_1) == 27
puts "failed array2 total" unless total(array_2) == 43
puts "failed sentence method" unless defined?(sentence_maker) ==  'method'
puts "failed sentence arguments" unless method(:sentence_maker).arity ==  1
puts "failed sentence1 building", first_sentence unless sentence_maker(first_sentence) ==  "All my socks are dirty."
puts "failed sentence2 building", second_sentence unless sentence_maker(second_sentence) ==  "Alaska has over 586 thousand miles."