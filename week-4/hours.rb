puts 'The program calculates the number of hours in a year'
puts 'What is the current year (if you want an average year enter 0)?'
year = gets.chomp.to_i
hoursInDay = 24
daysInYear = 365
daysInAverageYear = 365.2425
daysInLeapYear = 366
hoursInYear = hoursInDay*daysInYear
hoursinLeapYear = hoursInDay*daysInLeapYear
hoursinAverageYear = hoursInDay*daysInAverageYear
if year == 0 then 
	puts hoursinAverageYear
elsif (year % 4==0 && (year % 100>0 || year % 400==0)) then
	puts hoursinLeapYear
else
	puts hoursInYear
end
