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
=begin
How do you define a local variable?
	Ruby makes it easy. Just assign a value to the variable (meaning set the variable equal to something). 
	```ruby
	local_variable =  "A local variable of the string class"
	```
	Ruby, unlike JavaScript, does not require an explicit declartion like 'var local_variable'. To declare a global variable, add the '$' prefix to the variable name. 
How do you define a method?
	Use 'def' and the beginning and 'end' at the end. For example:
	```ruby
	def foo
		[do whatever the method does]
	end
	```
What is the difference between a local variable and a method?
	What is the difference between an apple and an orange? Seriously, I don't see how they are similar enough to be differentiated, but here goes. A local variable is an object, in one of the object classes like numeric, string, array, etc.  A method is something an object can do by calling the method like this: 'a_string.foo'
How do you run a ruby program from the command line?
	Type 'ruby file_name.rb'
How do you run an RSpec file from the command line?
	Type 'rspec file_name.rb' where the name typically has included a "_spec". I also accidently made it work with a file misnamed to the suffix was '.spec'.
What was confusing about this material? What made sense?
	The copying of the rspec files was a bit involved but not particularly confusing.  It's all good, and makes sense so far.
=end
