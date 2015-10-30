I'm submitting in this format to make the reflection (and core code) easier to read than it is in the .rb file on GitHub.  Here's the link to that file if you want to see those things there, or look at more of the code and the psuedocode:
https://github.com/JonClayton/phase-0/blob/master/week-5/calculate-mode/my_solution.rb

Here is the final refactored code for a hash-based approach:
```ruby
def mode(array)
  mode_machine = Hash.new(0)
  array.each {|element| mode_machine[element] += 1}
  highest_count = 0
  mode_machine.each do |element, count|
    if count > highest_count
      $mode_container = [] #need global variable since introduced inside score of do loop.
      highest_count = count
    end
    $mode_container << element if count == highest_count
  end
  $mode_container
end
```

Here is the refactored code for an array-based approach:
```ruby
def mode(array)
  until array == array.uniq do
    array.uniq.each {|element| array.delete_at(array.index(element))} 
  end
  array.sort
end
```

And from this I was able to do a one expression solution by introducing recursion and a ternary expression:
```ruby
def mode(array)
  array==array.uniq ? array.sort : array.uniq.each {|element| array.delete_at(array.index(element))} && mode(array)
end
```

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
