#Attr Methods

# I worked on this challenge by myself.

# I spent 1 hours on this challenge.

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

# Reflection