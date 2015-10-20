puts 'The program calculates the number of minutes in a decade'
puts 'What is the first year of the decade?'
yearone = gets.chomp.to_i
minutesInHour = 60
hoursInDay = 24
minutesInDay = minutesInHour*hoursInDay
daysInYear = 365
daysInAverageYear = 365.2425
daysInLeapYear = 366
minutesInYear = minutesInDay*daysInYear
minutesInLeapYear = minutesInDay*daysInLeapYear
minutesInAverageYear = minutesInDay*daysInAverageYear
year = 0
10.times do |x|
	year = yearone + x - 1 
	if (year % 4==0 && (year % 100>0 || year % 400==0)) then
		minutes += minutesInLeapYear
	else
		minutes += minutesInYear
	end
end
puts minutes
