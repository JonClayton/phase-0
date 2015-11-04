# I worked on this challenge with Abe Clark.
# I spent 2 hours on this challenge.

# RELEASE 2: NESTED STRUCTURE GOLF
# Hole 1
# Target element: "FORE"

array = [[1,2], ["inner", ["eagle", "par", ["FORE", "hook"]]]]

# attempts:
# ============================================================

p array[1][1][2][0]

# ============================================================

# Hole 2
# Target element: "congrats!"

hash = {outer: {inner: {"almost" => {3 => "congrats!"}}}}

# attempts:
# ============================================================

p hash[:outer][:inner]["almost"][3]

# ============================================================


# Hole 3
# Target element: "finished"

nested_data = {array: ["array", {hash: "finished"}]}

# attempts:
# ============================================================

p nested_data[:array][1][:hash]

# ============================================================

# RELEASE 3: ITERATE OVER NESTED STRUCTURES

number_array = [5, [10, 15], [20,25,30], 35]

number_array.map! do |x|
  if x.is_a? Integer
    x += 5
  else
    x.map! do |y|
      y += 5
    end
  end
end

p number_array


# Bonus:

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

#p recursive(startup_names)


startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

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

# At the cost of some readability this can be written in one line as a ternary, 
# which I think is a pretty clear way to read recursive methods:

def throughout_nest do_this_to, parent
  parent.map!{|child| child.is_a?(String) ? do_this_to.call(child) : throughout_nest(do_this_to, child)}
end

#p throughout_nest add_ly_to, startup_names 

=begin

## Reflection

###What are some general rules you can apply to nested arrays?
Values within nested arrays are accessed with a series of index numbers like `array_name[#][#][#][#]`. I find is easiest to figure those numbers out if I start with the last one, meaning the index of the item I want within its subarray and then back my way up the tree.

###What are some ways you can iterate over nested arrays?
You can use any of the methods we use for a flat array, such as `#map` or `#each`, or the more basic loops on index numbers, but you either need to nest those methods as deeply as the array is nested or learn to write a recursive iteration method that will dig as deep as necessary into the array.

###Did you find any good new methods to implement or did you re-use one you were already familiar with? What was it and why did you decide that was a good option?	
We couldn't find any array or enumerable method that would iterate through the nested structure while keeping it intacts.  If we didn't care about returning our result in a similarly nested structure, we could use `#flatten` to get a one dimensional array.

=end