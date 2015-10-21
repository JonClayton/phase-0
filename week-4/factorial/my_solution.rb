# Factorial

# I worked on this challenge [by myself, with: ].


# Your Solution Below
def factorial(number)
	return 1 if number <= 1
	method = 4
	result = 1
	case method
	when 1
		return number * factorial(number - 1)
	when 2
		(1..number).each {|x| result *= x}
	when 3
		return (1..number).inject {|product, x| product * x}
	when 4
		while number > 1
			result *= number
			number -= 1
		end
	when 5
		for x in 2..number do result *= x end
	end
	return result
end