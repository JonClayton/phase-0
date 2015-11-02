# Build a simple guessing game


# I worked on this challenge by myself.
# I spent <1 hours on this challenge.

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

##How do instance variables and methods represent the characteristics and behaviors (actions) of a real-world object?
I'm not sure I understand the question but the instance variable and methods let us create a model inside the class box (and sort of invisible to the outside user) that turns all our calculations and manipulations into much more plain language Ruby terminology.

##When should you use instance variables? What do they do for you?
Instance variables are used inside the class definition and are handy because they can be used throughout it, even though they are created in one method and being used in another. In this way they are like global variables would be in a program, available across methods.

##Explain how to use flow control. Did you have any trouble using it in this challenge? If so, what did you struggle with?
No problems here. This was sort of bare minumum flow control, with a gate (is the guess right?) Before a ternary, which is basically an IF-THEN-ELSE. I was going to use the `case` approach until I realized we needed a separate method for `#solved?`and that meant the code would read better having that in an `xxxx if solved?` line


##Why do you think this code requires you to return symbols? What are the benefits of using symbols?
I think the symbols are easier to work with. They don't require quotation marks, they don't have to be initialized, and I am sure there's other reasons that will become more apparent.
