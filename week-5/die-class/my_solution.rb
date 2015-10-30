=begin
Die Class 1: Numeric

# I worked on this challenge by myself

# I spent 1 hours on this challenge.

# 0. Pseudocode

# Input: user must be able to do the following
create a new die with a specified number of sides
check to see how many sides it has
roll the die and get a random result

# Output:
die=Die.new(6) creates a die
die.sides returns the number of sides
die.roll returns a random result among integers 1-die.sides

# Steps:
Create the new object class
allow the user to specify the number of sides when a new object is created
allow the user to check the number of sides
allow the user to roll the die

# 1. Initial Solution
=end

class Die_initial
  def initialize(sides)
  	unless sides.is_a?(Integer) && sides > 0
  		raise ArgumentError.new("Must be an integer larger than zero")
  	end
    @sides = sides
  end

  def sides
    @sides
  end

  def roll
    prng = Random.new
    prng.rand(1..@sides)
  end
end

# 3. Refactored Solution

class Die
  def initialize(sides)
  	unless sides.is_a?(Integer) && sides > 0
  		raise ArgumentError.new("Must be an integer larger than zero")
  	end
    @sides = sides
  end

  def sides
    @sides
  end

  def roll
    Random.rand(1..@sides) # runs much faster without a prng creation
    #(1..@sides).to_a.sample # and tried this but it is very slow
  end
end

=begin
# 4. Reflection
##What is an ArgumentError and why would you use one?
An ArgumentError is returned by a method call when the argument(s) fail to meet conditions imposed on them by the method. We can use it to "validate" any input to a method, though I don't like it much because it crashes the program.  I'd prefer to give the user another chance with a more forgiving error handling tool.

##What new Ruby methods did you implement? What challenges and successes did you have in implementing them?
I don't think I had used Random.rand before so that's a new class and method! I also haven't used sample before but it seems quite slow compared to #rand.

##What is a Ruby class?
A class is an object category with a set of methods and characteristics given to any new object created as an instance of that class.

##Why would you use a Ruby class?
You have to! Ruby is object oriented and everyting is an object.  If you type 1+1 into IRB you have used two instances of the class Fixnum. If the question is why would you create a custom class, it would be that the existence of a new class with specific methods is helpful to you. But I am wary that we not proliferate new classes. For example, this exercise could be done with a method `make_die(sides)` that does `(1..sides).to_a` and a method `#roll` that does `#sample` or another approach to drawing a random element of that array.  Object classes are more similar than they seem I think.

##What is the difference between a local variable and an instance variable?
Local variables have scope limitations within a program. They are limited to the method in which they are created unless passed into another method (I'm still wondering precisely how this works--the destructive/non-destructive exercise generated results I can't fully explain well). Instance variable are in a ay even more limited. They are attached to the particular instance of the object class in which they exist.  So @sides may be different for each Die that is created

##Where can an instance variable be used?
It must be created in the class definition and can be used in other methods defined in the class definition. It can be used outside the class definition if you provide a method with which to call it or use the convenient attr_reader syntax in the class definition. You can also reach it with instance_variable_get, but this is like breaking the window of the car because you locked your keys in it. 

=end