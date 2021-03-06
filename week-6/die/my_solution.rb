# Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.
# I spent <1 hours on this challenge.

# Pseudocode

# Input: an array of strings representing the sides of the die, and then methods asking for the number of sides or a throw of the die
# Output: die.sides returns number of sides.  Die.roll returns random side
# Steps:
# Start with die class from last week
# revise input at class creation to be an array of strings
# revise instance variable to count the sides in the string
# revise roll method to return result from sides array rather than a number 


# Initial Solution
=begin
class Die
  def initialize(sides)
    raise ArgumentError.new("Input of sides must be an array") unless sides.is_a?(Array)
 	@labels = sides
    @sides = sides.size
    raise ArgumentError.new("Number of sides can't be less than 1") unless @sides> 0
  end

  def sides
    @sides
  end

  def roll
    @labels[Random.rand(0..@sides-1)]
  end
end
=end
# Refactored Solution
# I really don't see a refactoring opportunity here other than writing more descriptive 
# variable names so I will do that and simplify the random number, along with correcting it 
# because I misunderstood how rand(num) works!

class Die
  def initialize(sides)
    raise ArgumentError.new("Input of sides must be an array") unless sides.is_a?(Array)
 	  @side_list = sides
    @side_count = sides.size
    raise ArgumentError.new("Number of sides can't be less than 1") unless @side_count> 0
  end

  def sides
    @side_count
  end

  def roll
    @side_list[rand(@side_count)]
  end
end

=begin
##What were the main differences between this die class and the last one you created in terms of implementation? Did you need to change much logic to get this to work?
There wasn't much difference. I just needed to add a little bit of logic to calculate the number of sides, check that the input was an array, and convert to roll to a side label instead of a side number.

##What does this exercise teach you about making code that is easily changeable or modifiable? 
KISS--keep it simple (we'll leave out the end of the acronym)

##What new methods did you learn when working on this challenge, if any?
I finally realized I could just use `rand(an_integer)` and adjust down to get an index number instead of `Random.rand(a_range)`.  Then later in the week I realized I was confused about the output of `#rand`.  How embarassing...had to come back here and take out a minus -1 that I thought was necessary but wasn't.  But in fact it didn't matter since an index range of -1 to 4 will get you all six sides as results, even though it's unconventional.  You could retrieve the side with -6 though -1 if you wanted to!

##What concepts about classes were you able to solidify in this challenge?
I think we are seeing them get more flexible.
=end
