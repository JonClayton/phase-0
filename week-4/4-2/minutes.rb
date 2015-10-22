puts 'The program calculates the number of minutes in a decade'
puts 'What is the first year of the decade?'
year = gets.chomp.to_i
endYear = year+9
minutes = 0
while year<=endYear do
	minutes += 365*24*60
	minutes += 24*60 if (year % 4==0 && (year % 100>0 || year % 400==0))
	year += 1
end
puts "The number of minutes in the decade you selected is #{minutes}"