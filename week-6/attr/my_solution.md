I'm submitting this via a `.md` file to make it easier to read.  Hope that's okay.

Here's the [link to the `.rb` version](https://github.com/JonClayton/phase-0/blob/master/week-6/attr/my_solution.rb)

And here is the code written in Release 5
```ruby
class NameData
	attr_reader :name
	def initialize
		@name = "Jon"
	end
end

class Greetings
	def initialize
		@student = NameData.new
	end

	def hello
		puts "Hello Student! How wonderful to see you today"
		puts "But I shouldn't call you Student when I know your name is #{@student.name}"
	end
end

greet = Greetings.new
greet.hello
```

##Release 1: Read and Research
###What are these methods doing?
The methods fall in two groups. One set return the value for each of the three instance variables in the class and the other set allow those values to be changed.

###How are they modifying or returning the value of instance variables?
They do so by accepting input from the user via the method call and setting the instance variable equal to the argument of the method call.

##Release 2: Identify the Changes
###What changed between the last release and this release?
The output was unchanged.  The code is addressed below.  Just a few lines changed

###What was replaced?
The method to return the value of @age was replaced by 'attr_reader :age`

###Is this code simpler than the last?
Yes, and I think I know what's coming next

##Release 3: More Changes
###What changed between the last release and this release?
Oooh, I was wrong.  I expected `attr_reader` for the other variables and we got `attr_writer :age` instead!

###What was replaced?
The method for changing the value of @age was replaced by another `attr` 

###Is this code simpler than the last?
Yes, and I'm sure I know what's next.

##Release 6: Reflect
###What is a reader method?
A reader method allows the instant variable to be seen from outside the object with the symbol for the variable as a method name

###What is a writer method?
A writer method allows the instant variable to be changed from outside the object with the symbol for the variable as a method name

###What do the attr methods do for you?
They save the trouble of writing a method, making it easier and (unless your method fully duplicated their effect) clearer to manipulate their values.

###Should you always use an accessor to cover your bases? Why or why not?
No.  They should be used only when you need to be able to read and/or change instance variables. You might not want to because they are intended to be secure, or simply because you know you don't want to use them and you don't want to risk code elsewhere in the program affecting what's going on inside the object definition. Keeping variable scope narrow makes debugging what's happening with that variable quite a bit easier.

###What is confusing to you about these methods?
Nothing is confusing because they are so simple. Now I see why we were using symbols in another exercise!
