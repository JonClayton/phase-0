I'm sorry if you're expecting a hard to read .rb file.  I'm submitting this one instead to improve readability.  Normally I paste code into one of these documents here, but the code for this exercise is pretty long.  Here is a link to it, and the refactored solution appears below the reflections: https://github.com/JonClayton/phase-0/blob/master/week-5/acct_groups.rb

##What was the most interesting and most difficult part of this challenge?
The dealing out of the cards for the AG members was pretty slick, and the process for removing a member, figuring out what to do next and doing it was very involved.  I now suspect it would have been easier if the data structure were a hash with name as key and AG number as value, but then we'd have the hassle of counting members of groups to figure out how many in each one.

##Do you feel you are improving in your ability to write pseudocode and break the problem down?
I used psuedocode for the basic structure but all the real work was in the refactoring bucket when I was adding features. Perhaps I should have done some psuedocoding then too! 

##Was your approach for automating this task a good solution? What could have made it even better?
I'd say the team formation approach was a clear win, and the printing mechanism looks good. The remove_person method is not as clean as I would like and I bet taking another run at it with a different data structure as mentioned above might generate a better result.

##What data structure did you decide to store the accountability groups in and why?
I used an array because the groups are numbered, so array index was fine.

##What did you learn in the process of refactoring your initial solution? Did you learn any new Ruby methods?
No new methods here, but I did leann how to created an empty array of arrays in one line.

```ruby
$cohort = ['Syema Ailia','Alan Alcesto','Daniel Andersen','James Artz','Darius Atmar','Brian Bensch','Nicola Beuscher','Kris Bies','Logan Bresnahan','William Brinkert','Scott Chou','Bernice Anne W Chua','Abraham Clark','Jon Clayton','Kevin Corso','Jacob Crofts','Amaar Fazlani','Solomon Fernandez','Edward Gemson','Jamar Gibbs','Chris Gomes','Will Granger','Christopher M. Guard','Ryan Ho','Igor Kazimirov','Walter Kerr','Karla King','Becky Lehmann','Malia Lehrer','Carolina Medellin','Timothy Meixell','Chris Miklius','Joshua Monzon','Shea Munion','Bryan Munroe','Trevor Newcomb','Aleksandra Nowak','Fatma Ocal','Van Phan','Luis Fernando Plaz','Natalie Polen','Alicia Quezada','Jessie Richardson','Nimi Samocha','Zach Schatz','Tal Schwartz','Pratik Shah','Josh Shin','Shawn Spears','Sasha Tailor','Nil Thacker','Natasha Thapliyal','Sabrina Unrein','Brian Wagner','Clinton Weber','Gregory Wehmeier','Michael Whelpley','Peter N Wood','Ryan Zell']
$ag_cap = 5 #largest size Accountablity Group allowed
	
def make_groups
	number_of_groups = ($cohort.size-1) / $ag_cap + 1
	$roster = Array.new(number_of_groups) {Array.new()} 
	while $cohort.size > 0
		$roster.map! {|team| team << $cohort.pop}
	end
end

def print_groups
	$roster.each_index do |index| 
		puts "Accountability Group #{index+1}:" 
		$roster[index].each {|person| puts person}
		puts "------------------------------"
	end
end

def remove_person(name)
	vacant_slot = []
	move_someone = true
	mover = []
	#we are looking for and deleting the person, and identifying potential replacement if appropriate
	$roster.each.with_index do |group, index| 
		mover = [index,$ag_cap-1] if group[$ag_cap-1]
		$roster[index] = group.compact
		if group.find_index(name)
			vacant_slot = [index, group.find_index(name)]
			$roster[index].delete_at(vacant_slot[1])
			move_someone = !$roster[index][$ag_cap-2]
		end
	end
	puts "#{name} has been removed from the roster for Accountability Group #{vacant_slot[0]+1}"
	# now we moving in a replacement if appropriate, fold the group if appropriate, or continue on as-is.
	vacancy_group = $roster[vacant_slot[0]]
	if move_someone && mover != []
		$roster[vacant_slot[0]] << $roster[mover[0]][mover[1]]
		$roster[mover[0]].delete_at(mover[1])
		puts "#{$roster[vacant_slot[0]].last} will move from Group #{mover[0]+1} to fill the empty slot"
	elsif vacancy_group.size < $ag_cap-1 && $roster.size > vacancy_group.size
		puts "That Group was down to #{vacancy_group.size} members and they are reassigned:"
		$roster.each.with_index do |group, index| 
			if group.size == 4 && vacancy_group.size > 0
				reassignee = vacancy_group.pop
				$roster[index] << reassignee
				puts "#{reassignee} goes to Group #{index+1}"
			end
		end
	else 
		puts "That Group will continue on as-is."
	end
end
#various testing operations
# $cohort.shuffle!
make_groups
print_groups
remove_person('Syema Ailia')
remove_person('Ryan Ho')
```
