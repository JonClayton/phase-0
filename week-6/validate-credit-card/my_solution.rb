# Class Warfare, Validate a Credit Card Number


# I worked on this challenge with Jacob Crofts.
# I spent 2 hours on this challenge.

# Pseudocode

# Input:
# => integer
# Output:
# => true or false when #check_card is called
# Steps:
# Build class with following features
# split number into array of single digits
# Test for 16 digits
# Test for odd or even number of digits
#  Odd tells us to double the even indexed digits
#  Even tell us to double the odd indexed digits
# iterate through the array doubling the correct digits
# separate any new two digit numbers into single digits
# sum all digits and test whether multiple of 10
# return test result


# Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits
=begin
class CreditCard
  def initialize (card_number)
    @card = card_number.to_s.split("")
    raise ArgumentError.new("Need a 16 digit number") unless @card.size == 16
  end
    
  def calc_start_index
    @card.size % 2 == 0 ? @start_index = 1 : @start_index = 0
  end
  
  def double_correct_digits
    @double = @card.each_with_index do |digit,index|
      if index % 2 != @start_index
        @card[index] = digit.to_i * 2 
      end
    end
  end
  
  def is_sum_div_by_10?
    @double.join("").split("").map{|digit| digit.to_i}.reduce(:+) % 10 == 0
  end
  
  def check_card
    calc_start_index
    double_correct_digits
    is_sum_div_by_10?
  end  
end

new_card = CreditCard.new(4408041234567901)
p new_card.check_card
=end
# Refactored Solution

class CreditCard
  def initialize (card_number)
    @card = card_number.to_s.split("")
    raise ArgumentError.new("Need a 16 digit number") unless @card.size == 16
  end
    
  def calc_start_index
    @card.size % 2 == 0 ? @start_index = 0 : @start_index = 1
  end
  
  def double_correct_digits
    @double = @card.map.with_index do |digit, index|
      index % 2 == @start_index ? digit.to_i * 2 : digit.to_i
    end
  end
  
  def is_sum_div_by_10?
    @double.join("").split("").map{|digit| digit.to_i}.reduce(:+) % 10 == 0
  end
  
  def check_card
    calc_start_index
    double_correct_digits
    is_sum_div_by_10?
  end  
end

=begin
##Reflection
###What was the most difficult part of this challenge for you and your pair?
We got hung up a little while by a very basic error on the @start_index calcualtion that led us to be doubling the wrong numbers. Which is funny because that's actually not a required element of the solution since the card_number is required to be 16 digits.

###What new methods did you find to help you when you refactored?
We discoved there is a `#map.with_index`. It is sort of hidden under `#map` in the Array methods, where it is an example for `#map` but not a method of its own. I suppose this is because `#with_index` is actually a separate Enumerable method, which is downright weird since there is an `#each_with_index` method that is explicitly listed in the Enumerable methods. 

###What concepts or learnings were you able to solidify in this challenge?
I think we did a very nice job on readability.  We also broke the problem into pieces that resulted in compact class methods and a very clean result. It was the best work I've done with a pair and it was done quickly too.
=end
