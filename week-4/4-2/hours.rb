puts 'The program calculates the number of hours in a year'
puts 'Do you want a leap year?'
response=gets.chomp
if response[0].downcase=='y' then
	daysInYear = 366
	else
	puts 'Do you want a solar (average) year?'
	response=gets.chomp
	if response[0].downcase=='y' then
		daysInYear = 365.2524
		else
		puts 'Okay, I am using a boring 365 day year'
		daysInYear = 365
	end
end
hoursInDay = 24
hoursInYear = hoursInDay*daysInYear
puts "The number of hours in your selected year is #{hoursInYear}"