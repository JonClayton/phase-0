I'm submitting this in Markdown format because I find it much easier to read, especially the reflections.

Here's a [link to the Ruby file](https://github.com/JonClayton/phase-0/blob/master/week-6/nested_data_solution.rb)

Here's the code for Release 3:
```ruby
number_array.map! do |x|
  if x.is_a? Integer
    x += 5
  else
    x.map! do |y|
      y += 5
    end
  end
end
```

Two solutions for the bonus. We felt it important to write this recursively so it wasn't sensitive to how many layers of nesting are in the matrix:
```ruby
def recursive (array)
  array.map! do |x|
    if x.is_a? String
      x += "ly"
    else
      recursive(x)
    end
  end
end
p recursive(startup_names)
```

And then to generalize more, I worked out how to use a proc so the recursive method itself is responsible for only the iteration through the next, while it receives an argument that performs the desired operation on each element it encounters while iterating:
```ruby
startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

add_ly_to = Proc.new {|string| string += "ly"}

def throughout_nest do_this_to, parent
  parent.map! do |child|
    if child.is_a? String
      do_this_to.call(child)
    else
      throughout_nest do_this_to, child
    end
  end
end

p throughout_nest add_ly_to, startup_names 
```

##Reflection
###What are some general rules you can apply to nested arrays?
Values within nested arrays are accessed with a series of index numbers like `array_name[#][#][#][#]`. I find is easiest to figure those numbers out if I start with the last one, meaning the index of the item I want within its subarray and then back my way up the tree.

###What are some ways you can iterate over nested arrays?
You can use any of the methods we use for a flat array, such as `#map` or `#each`, or the more basic loops on index numbers, but you either need to nest those methods as deeply as the array is nested or learn to write a recursive iteration method that will dig as deep as necessary into the array.

###Did you find any good new methods to implement or did you re-use one you were already familiar with? What was it and why did you decide that was a good option?	
We couldn't find any array or enumerable method that would iterate through the nested structure while keeping it intact.  If we didn't care about returning our result in a similarly nested structure, we could use `#flatten` to get a one dimensional array.
