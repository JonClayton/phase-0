# Build a simple guessing game


# I worked on this challenge [by myself, with: ].
# I spent [#] hours on this challenge.

# Pseudocode

# Input: #new(number) creates a game guessing a the specified number.  There is no limit to the number
#        #guess(number) is a new guess
# Output:#guess returns :high or :low or :correct 
# Steps:
# create the class
# initialize it by saving the number given when #new performed
# create method comparing guess to answer and returning true or false
# create method comparing guess to answer and returning correct/high/low


# Initial Solution
=begin
class GuessingGame
  def initialize(answer)
    @answer = answer
  end

  def solved?
  	@guess == @answer
  end

  def guess(guess)
  	@guess = guess
  	return :correct if solved?
  	@guess > @answer ? :high : :low
  end
end

=end


# Refactored Solution
# I really don't see any refectoring opportunities.  I could make it read even more 
# plain english and take out the ternary, but that seems like overkill.
# I like the return :correct if solved?  Very plain english!

class GuessingGame
  def initialize(answer)
    @answer = answer
  end

  def solved?
  	@guess == @answer
  end

  def guess(guess)
  	@guess = guess
  	return :correct if solved?
  	@guess > @answer ? :high : :low
  end
end



# Reflection
