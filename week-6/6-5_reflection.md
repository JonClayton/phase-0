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

Three solutions for the bonus follow. We felt it important to write this recursively so it wasn't sensitive to how many layers of nesting are in the matrix:
```ruby
startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

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
Then to generalize more, I worked out how to use a proc so the recursive method itself is responsible for only the iteration through the next, while it receives an argument that performs the desired operation on each element it encounters while iterating.  This makes it more generalized.  I've also used descriptive variable names to maximize readability.
```ruby
add_ly_to = Proc.new {|string| string += "ly"}

def throughout_nest do_this_to, parent
  parent.map! do |child|
    if child.is_a? String
      do_this_to.call child
    else
      throughout_nest do_this_to, child
    end
  end
end

p throughout_nest add_ly_to, startup_names 
```
If I wasn't maximizing readability this would be a one line method using a ternary, which seems to me the natural way to express a recursive function.  In doing this I discovered that the Ruby format option of listing method arguments without parentheses appears to create problems in ternaries--note the parentheses used 
```ruby
def throughout_nest do_this_to, parent
  parent.map!{|child| child.is_a?(String) ? do_this_to.call(child) : throughout_nest(do_this_to, child)}
end
```
Finally, Timothy Meixell and I were frustrated by the lack of a built-in method that allows map to penetrate a nested array. So we collaborated on building one and the result also fixes the curious (to me) flaw in `Hash#map` that causes it to return an array when the point of `#map` is staying in the same structure. Here's the result. Note that we don't know all the classes that use the Enumerable module so it's not guaranteed to work for anything other than hashes and arrays. Note also that if the array elements and hash values are not all the same class, your block must deal with that or you'll get an error for unexpected class type. The example below would crash if it encountered a non-numeric element it was supposed to change.
```ruby
module Enumerable
  def map_plus (&block)
    if self.class == Hash
      self.each {|key,child| (child.is_a?(Enumerable)) ? self[key]=child.map_plus(&block) : self[key]=yield(child)}
    else
      self.map {|child| (child.is_a?(Enumerable)) ? child.map_plus(&block) : yield(child)}
    end
  end
end

array = [0,1,[2,3,[4,5,6]]]
hash = {name: 15, age: 49, third: {cat: 12, frog: 2, next: {ape: 4, fish: 6}}}
mixed = [0,1,{name: 15, age: 49, third: {cat: 12, frog: 2, fourth: [2,3,[4,5,6]]}}]
p array.map_plus {|x| x+2}
p hash.map_plus {|x| x+2}
p mixed.map_plus {|x| x+2}
```

##Reflection
###What are some general rules you can apply to nested arrays?
Values within nested arrays are accessed with a series of index numbers like `array_name[#][#][#][#]`. I find is easiest to figure those numbers out if I start with the last one, meaning the index of the item I want within its subarray and then back my way up the tree.

###What are some ways you can iterate over nested arrays?
You can use any of the methods we use for a flat array, such as `#map` or `#each`, or the more basic loops on index numbers, but you either need to nest those methods as deeply as the array is nested or learn to write a recursive iteration method that will dig as deep as necessary into the array.

###Did you find any good new methods to implement or did you re-use one you were already familiar with? What was it and why did you decide that was a good option?	
We couldn't find any array or enumerable method that would iterate through the nested structure while keeping it intact.  If we didn't care about returning our result in a similarly nested structure, we could use `#flatten` to get a one dimensional array.
