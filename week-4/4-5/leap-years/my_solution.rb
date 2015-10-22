# Leap Years

# I worked on this challenge with: Gregg Wehmeier.

# Don't forget the 100 and 400 flavor to leap years

# Your Solution Below

#   Jon's solution with four options
def options_leap_year?(year)
	method = 4
	case method
	when 1
		case
		when year % 400 == 0
		return true
		when year % 100 == 0
	    return false
		when year % 4 > 0
	    return false
    end
    when 2
        return false if year % 4 > 0 || (year % 100 == 0 && year % 400 >0)
    when 3
    	if year % 4 > 0
    		return false
    	elsif year % 400 == 0
    		return true
    	elsif year % 100 == 0 
    		return false
    	end 
    when 4
        return !(year % 4 > 0 || (year % 100 == 0 && year % 400 >0))
    end
    true
end

# A compact single expression solution
def leap_year?(year)
    !(year%4>0||(year%100==0&&year%400>0))
end