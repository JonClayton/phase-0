# OO Basics: Student


# I worked on this challenge with: Trevor Newcomb
# This challenge took me [4] hours.


# Pseudocode



# Initial Solution

class Student
  attr_accessor :scores, :first_name

  def initialize(student_first_name,scores_array)   #Use named arguments!
    @first_name = student_first_name
    @scores = scores_array
  end
  
  def average
    @average = @scores.reduce(:+)/@scores.size
  end
  
  def letter_grade
    letters = ["A","B","C","D","F"]
    @grade = letters[[[9-(@average/10).to_int,0].max,4].min]
  end
  
end

alex = Student.new("Alex", [100,100,100,0,100])
betty = Student.new("Betty", [100,100,100,80,100])
carl = Student.new("Carl", [100,0,100,65,100])
david = Student.new("David", [90,70,70,72,65])
ellie = Student.new("Ellie", [50,40,30,-13,100])

students = [alex,betty,carl,david,ellie]

# def linear_search(array, search_target)
#   array.each_with_index do |element,index| 
#     if element.first_name == search_target
#       return index
#     end
#   end
#   return -1
# end

# def binary_search(array, search_target, original_index_of_current_zero_index=0)
#   index = array.size/2.to_int
#   first_name = array[index].first_name
#   return index+original_index_of_current_zero_index if search_target==first_name 
#   return binary_search(array.slice(0,index), search_target,original_index_of_current_zero_index) if search_target < first_name 
#   return binary_search(array.slice(index+1,index),search_target,original_index_of_current_zero_index+index+1)
# end


# Refactored Solution
def linear_search(array, search_target)
  array.each_with_index {|element,index| return index if element.first_name == search_target}
  return -1
end

def binary_search_refactored(array, search_target, original_index_of_current_zero_index=0)
  index = array.size/2.to_int
  first_name = array[index].first_name
  return index+original_index_of_current_zero_index if search_target==first_name 
  adder = search_target < first_name ? 0 : index+1
  return binary_search_refactored(array.slice(adder,index),search_target,original_index_of_current_zero_index+adder)
end


# Improved version of binary search, generalizing and using a lambda to allow user to descibe what constitutes a match with the ordered array
def midpoint_of(range)
  (range.begin + range.end)/2.to_int
end

def target_at_midpoint (target, range, what_target_matches)
  target == what_target_matches.call(midpoint_of(range))
end

def target_in_bottom_half (target, range, what_target_matches)
  target < what_target_matches.call(midpoint_of(range))
end

def binary_search(array, target, what_target_matches)
  lowest_possible_index = 0
  highest_possible_index = array.size-1
  range = (lowest_possible_index..highest_possible_index)
  until target_at_midpoint(target, range, what_target_matches) do
    if target_in_bottom_half(target, range, what_target_matches) 
      highest_possible_index = midpoint_of(range) - 1 
    else lowest_possible_index = midpoint_of(range) + 1
    end
    range = (lowest_possible_index..highest_possible_index)
  end
  return midpoint_of(range)
end

# DRIVER TESTS GO BELOW THIS LINE
# Initial Tests:

p students[0].first_name == "Alex"
p students[0].scores.length == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0


# Additional Tests 1:

p students[0].average == 80
p students[0].letter_grade == 'B'

# Additional Tests 2:

p linear_search(students, "Alex") == 0
p linear_search(students, "NOT A STUDENT") == -1

p binary_search_refactored(students, "Ellie")
p binary_search(students, "Betty", lambda {|index| students[index].first_name})

=begin
###Reflection
####What concepts did you review in this challenge?
Fibonacci was about negative index numbers when I used an array, not much review when I switched to just keeping track of two variables. It was nice to do an exercise that made me learn lambdas, which I used to generalize the binary search in the OOP exercise

####What is still confusing to you about Ruby?
Not much other than keeping syntax straight as I go back and for between Ruby and JS.

####What are you going to study to get more prepared for Phase 1?
Seeing as how I'm writing this Sunday at 11:31PM, not much for Monday, but I plan to do more Ruby exercise, go deeper into RubyMonk, and continue challenges in Ruby at Coderbyte
=end