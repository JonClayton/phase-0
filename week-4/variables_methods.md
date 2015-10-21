I apologize if it is a problem but linking to a `.rb` file made it hard to set up the comments in a readable way, and links would also be difficult. So I'm using this `.md` document to give readable reflections. Below I include the code and links to the `.rb` files.

##How do you define a local variable?
Ruby makes it easy. Just assign a value to the variable (meaning set the variable equal to something). 
```ruby
local_variable = "A local variable of the string class"
```
Ruby, unlike JavaScript, does not require an explicit declaration like 'var local_variable'. To declare a global variable, add the `$` prefix to the variable name. 

##How do you define a method?
Use `def` and the beginning and `end` at the end, with arguments for the method either within parentheses or listed after the name of the method For example:
```ruby
def foo (x,y,z) # or foo x y z
  return x/y*z # do whatever the method does, and the return is optional if the last expression is what you want to return
end
```

##What is the difference between a local variable and a method?
What is the difference between an apple and an orange? Seriously, I don't see how they are similar enough to be differentiated, but here goes. A local variable is an object, in one of the object classes like numeric, string, array, etc. A method is something an object can do by calling the method like this: `a_string.foo`

##How do you run a ruby program from the command line?
Type `ruby file_name.rb`

##How do you run an RSpec file from the command line?
Type `rspec file_name.rb` where the name typically has included a `_spec`. I also accidently made it work with a file misnamed to the suffix was `.spec`.

##What was confusing about this material? What made sense?
The copying of the rspec files was a bit involved but not particularly confusing. It's all good, and makes sense so far. Honestly the hardest part was realizing the format for submitting solutions didn't really work and putting this together!

##Links and code for solutions

[4.3 Variables and Methods](https://github.com/JonClayton/phase-0/blob/master/week-4/variables-methods.rb)
```ruby
puts "What is your first name?"
first_name = gets.chomp
puts "What is your middle name(s)"
middle_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
name = first_name + " " + middle_name + " " + last_name
puts "Greetings Earthling named #{name}. Please tell me your favorite number."
favorite_number = gets.chomp.to_i
if favorite_number == 0 then
  puts "You are an annoying Earthling, #{name}. I wanted an integer greater than 0. But I will use 0 since you are a mere human." 
  favorite_number = 7
end
puts "I have a suggestion #{name}. Your favorite number should be #{favorite_number+1}. It is bigger and better!"
```

[4.3.1 Return a Formatted Address](https://github.com/JonClayton/phase-0/blob/master/week-4/address/my_solution.rb)
```ruby
# Format an Address

# I worked on this challenge by myself.


# Your Solution Below
def make_address(street,city,state,zip)
  return "You live at #{street}, in the beautiful city of #{city}, #{state}. Your zip is #{zip}."
end
```

[4.3.2 Defining Math Methods](https://github.com/JonClayton/phase-0/blob/master/week-4/math/my_solution.rb)
```ruby
# Math Methods

# I worked on this challenge by myself.


# Your Solution Below

def add(num_1, num_2)
 num_1 + num_2
end

def subtract(num_1, num_2)
 num_1 - num_2
end

def multiply(num_1, num_2)
 num_1 * num_2
end

def divide(num_1, num_2)
 num_1.to_f / num_2.to_f
end
```



