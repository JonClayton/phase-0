Hope you don't mind this is submitted in Markdown rather than directly to the Ruby file.  I this is is much easier to work with.
Here's the [link to the `.rb` file](https://github.com/JonClayton/phase-0/blob/master/week-6/die/my_solution.rb)

And here's the final refactored code:
```ruby
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
    @side_list[rand(@side_count)-1]
  end
end
```

##What were the main differences between this die class and the last one you created in terms of implementation? Did you need to change much logic to get this to work?
There wasn't much difference. I just needed to add a little bit of logic to calculate the number of sides, check that the input was an array, and convert to roll to a side label instead of a side number.

##What does this exercise teach you about making code that is easily changeable or modifiable? 
KISS--keep it simple (we'll leave out the end of the acronym)

##What new methods did you learn when working on this challenge, if any?
I finally realized I could just use `rand(an_integer)` and adjust down to get an index number instead of `Random.rand(a_range)`.

##What concepts about classes were you able to solidify in this challenge?
I think we are seeing them get more flexible.
