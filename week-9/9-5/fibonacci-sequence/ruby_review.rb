# I worked on this challenge by myself
# This challenge took me <1 hours.

# Pseudocode
# WHILE number is > highest Fibonacci number, build Fibonacci sequence as array
# WHEN LOOP FINISHES, return true or false on number equal to highest bnumber in sequence

# Initial Solution

def is_fibonacci_original(num)
	fib=[0,1]
	while fib[-1]<num do
		fib.push(fib[-1]+fib[-2])
	end
	return fib[-1] == num
end

# Refactored Solution

def is_fibonacci_refactored(num)
	fib=[0,1]
	fib.push(fib[-1]+fib[-2]) while fib[-1]<num 
	fib[-1] == num
end

# we could also make this more memory efficient, though less pithy:

def is_fibonacci?(num)
	fib1=0
	fib2=1
	while fib2<num 
		fib_next = fib1+fib2
		fib1=fib2
		fib2=fib_next
	end
	fib2 == num
end

# Reflection
