=begin

# I worked on this challenge with: Gregg Wehmeier.

# Your Solution Below

Jon's alternate approaches:
Need three sides >0 and longest shorter than sum of other two
a: sort to find largest and smallest side and test
b: don't sort, just add all three pairs and compare to other
c: use #max #min to find largest and smallest
=end

# Jon's various solutions
def options_valid_triangle? (a,b,c)
  method = 4
  case method
  when 1
  	triangle = [a,b,c].sort
  	return false if triangle[0]<=0
  	return true if triangle[2] <= triangle[1] + triangle[0] 
  when 2
  	return false if (a<=0 || b<=0 || c<=0)
    return true if (a+b>c && b+c>a && c+a>b)
  when 3
  	return false if [a,b,c].min<=0
    return true if 2*[a,b,c].max<a+b+c
  when 4
    return true if ([a,b,c].min>=0 && 2*[a,b,c].max<a+b+c)
  end
false
end

# A compact single expression:
def valid_triangle?(a,b,c)
  [a,b,c].min >= 0 && 2 * [a,b,c].max < a + b + c
end