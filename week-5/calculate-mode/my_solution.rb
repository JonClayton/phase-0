=begin

# Calculate the mode Pairing Challenge

# I worked on this challenge [by myself, with James Artz

# I spent 5 hours on this challenge because I spent so much time refactoring

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented.

# 0. Pseudocode


## What is the input?

An array of numbers or strings

## What is the output? (i.e. What should the code return?)

An array of the most frequent elements
- an array
- not a set number of values (1 or more)


## What are the steps needed to solve the problem?

create a container that holds the elements and the number of times they occur. The default count for the number of times an element occurs is 0.

iterate over the array, record each element and for each element increase its count by one.

add the element to the container if it is not already there.
increase the count for that element by one. 

END loop.

# - output the items that have the highest count.

Determine the highest count value
set highest value tracker to 0
create container to hold modes
Loop through the container
if value > tracker
   set tracker = value
   reset mode container to empty
   put current element into mode container
end if
if value = tracker add current element to container
END LOOP
 Return these elements that are in the mode container

Alternatively, since we don't need to know how often the modes occur or how
often any other items occur, we can just 
--start LOOP
--iterate through array
--remove one instance of every item--reducing all their counts by one
--repeat LOOP until there is only one instance of every item left in the arrayy 
--return the array

# 1. Initial Solution
=end

def inital_hash_mode(array)
  mode_machine = Hash.new(0)
  array.each do |element|
    mode_machine[element] += 1
  end
  highest_count = 0
  mode_container = []
  mode_machine.each do |element, count|
    mode_container << element if count == highest_count
    if count > highest_count
      mode_container = []
      mode_container << element
      highest_count = count
    end
  end   
  mode_container
end

def intial_array_mode(array) #only works for numbers
  array.sort!
  while array.size > 0 do
    last_array = [] + array
    max = array.max
    min = array.min
    for num in min..max do 
      array.delete_at(array.index(num)) if array.include?(num)
    end
  end
  last_array
end

# 3. Refactored Solutions

# You can pick which to run by changing the method variable in line 100

def mode(array)
  method = "recursive" # choices: hash clear_array terse_array for_the_win array.uniq.each recursive and_finally
  case method

  when "hash"
    mode_machine = Hash.new(0)
    array.each {|element| mode_machine[element] += 1}
    highest_count = 0
    mode_machine.each do |element, count|
      if count > highest_count
        $mode_container = [] #needed to be global since not created until inside this loop's scope
        highest_count = count
      end
      $mode_container << element if count == highest_count
    end
    return $mode_container

  when "clear_array"
    array.sort!
    while array.size > 0 do
      prior_array = [] + array
      for index in array.size.downto(1)         
        if (array[index-1] != array[index])
          array.delete_at(index) 
        end
      end
      array.delete_at(0)
    end
    return prior_array
    
  when "terse_array"
    while array.size > 0 do
      array.sort!.map!.with_index{|element, index| (array[index] != array[index+1]) || index == array.size ? nil : element}.compact!
       return array if array == array.uniq
    end
    
  when "for_the_win"
    until array == array.uniq do
      array.sort!.map!.with_index {|element, index| (array[index] != array[index+1]) || index == array.size ? nil : element}.compact!
    end
    array
  
    # here I change track on the array approach with 
    # #uniq, which gives me a list of the elements that appear
    # so I can delete them each once and do it over and over   
    # again until only the ones that were most common remain.
    
  when "array.uniq.each"
  until array == array.uniq do
    array.uniq.each {|element| array.delete_at(array.index(element))} 
  end
  array.sort
    
  when "recursive"
    return array.sort if array == array.uniq
    array.uniq.each {|element| array.delete_at(array.index(element))}
    mode(array)
    
  when "and finally" # we get down to one line, though I wish the block inside #each was more elegant
    array == array.uniq ? array.sort : array.uniq.each {|element| array.delete_at(array.index(element))} && mode(array)
  end
end 

=begin

# 4. Reflection

##Which data structure did you and your pair decide to implement and why?
We did both. A hash would be the obvious choice if you view the problem as totalling up the occurences for each word, since that task plays to two advantages of hashes: (a) strings can be the key/index, and (b) a default value of zero can be assigned to new keys, so there's no differnce between adding one to the value for an existing key and creating a new key with value of 1 (by adding one to its default value of zero)

However, the solution is much more elegant when you realize that the problem doesn't require us to know either the actual counts for any of the items. It just wants an array with the most common items. So if we can devise a way to delete from the array one occurence of all the numbers in the array, we can repeat this operation until the array is down to only one occurence of each of the modes. This approach allows us to leave the data in an array.


##Were you more successful breaking this problem down into implementable pseudocode than the last with a pair? 

Not really because this was required a couple more steps. But we still were better at the process--we just had more to process.


##What issues/successes did you run into when translating your pseudocode to code?

As usual starting to write code makes us a bit more aware of the constraints of logic--"we want to do this" is limited by "I know how to do that but not this." But if we write the psuedocode with actual code just a bit more in mind that will get better


##What methods did you use to iterate through the content? Did you find any good ones when you were refactoring? Were they difficult to implement?

Finding #uniq was magical for the array aproach because it gave us the set of elements we needed to delete. It was a very brittle structure before then when we were deterimining uniqueness by sorting the array and comparing neighbors.  With #uniq this algorithm can be written on one line in a fairly parsable way.

I ran into #map and #compact along the way for the array approach too, as it was better to replace elements with nil than delete them when going through the array by index number.  We also used #delete.at_index and #index to find the first occurence of characters and delete them.
	
=end