=begin
Grocery List GPS Challenge 2.2

I worked on this challenge with: Nicola Beuscher

I spent [4] hours on this challenge.

0. Pseudocode

What is the input?
Grocery item, quantities

What is the output? (i.e. What should the code return?)
print the grocery list

What are the steps needed to solve the problem?

Create empty container to hold grocery list
Allow user to name the list

Define method for adding to the list
  Accept input: Item, Quantity
  Add that pair to the list
  Decide what to do if item is already on the list
    Add or replace existing item

Define method for removing from the list
Input: Item
Removes item and quantity

Define method for updating quantities
Input: Item, Quantity
Replaces quantity for existing item

Define method for printing the list to the screen
Input: user desire for list
Output: printed list

Show users list of options for their grocery list

# 1. Initial Solution
=end
def initial_solution # to keep formatting but not invoke
$grocery_list = {}

def new_list
  $grocery_list = {}
end

def add_item (item, quantity)
  $grocery_list[item] = quantity
end

def delete_item (item)
  $grocery_list.delete(item)
end

def update_item (item, quantity)
  $grocery_list[item] = quantity
end

def print_list
  puts $grocery_list
end

done=false
until done
puts "Do you want a New list, Add an item, Delete an item, Update quantity, or Print the list? Input the first letter of your choice"
choice = gets.chomp.downcase
case choice
  when "n"
  new_list
  when "a"
  puts "What item do you want to add?"
  item = gets.chomp
  puts "How many?"
  quantity = gets.chomp
  add_item(item,quantity)
  when "d"
  puts "Which item do you want to delete?"
  item = gets.chomp
  delete_item(item)
  when "u"
  puts "Which item do you want to update?"
  item = gets.chomp
  puts "How many (new total, please)?"
  quantity = gets.chomp  
  update_item(item,quantity)
  when "p"
  print_list
  done=true
  end
end

end #to keep formatting but not invoke

# 3. Refactored Solution

def new_list
  $grocery_list = {}
end

def add_item(item,quantity)
  update_list(item,quantity)
end

def delete_item (item)
  $grocery_list.delete(item)
end

def update_item(item,quantity)
  update_list(item,quantity)
end

def print_list
  puts_line
  puts "Here's your current list:"
  $grocery_list.each {|item, quantity| puts "#{item}: #{quantity}"}
  puts_line
end

def print_items
  puts_line
  print "Your items are: "
  puts $grocery_list.keys.join(",")
end 

def puts_line
  puts "--------------------------" 
end  

def update_list (item,quantity)
  $grocery_list[item] = quantity
end

def get_item_input(request)
  puts "What item do you want to #{request}?"
  item = gets.chomp
end

def get_item_quantity(item)
  quantity = 0
  while quantity < 1 do
    puts "How many #{item} would you like?"
    quantity = gets.chomp.to_i
    puts "I think you want a positive number" if quantity < 1
  end
  return quantity
end

def get_item_change_input(request)
  print_items
  get_item_input(request)
end

new_list
item = ""
done = false
until done
  print_list
  puts "Do you want to:"
  puts "Start new list"
  puts "Add an item"
  puts "Delete an item" 
  puts "Update quantity or" 
  puts "Print the list and quit." 
  puts "Input the first letter of your choice."
  choice = gets.chomp.downcase[0]
  case choice
  when "s"
    new_list
  when "a"
    item = get_item_input("add")
    quantity = get_item_quantity(item)
    update_list(item,quantity)
  when "d"
    item = get_item_change_input("delete")
    delete_item(item)
  when "u"
    item = get_item_change_input("update")
    quantity = get_item_quantity(item)
    update_item(item,quantity)
  when "p"
    print_list
    done = true
  end
end

=begin
4. Reflection

What did you learn about pseudocode from working on this challenge?

It is messy to write when you're describing a program rather than just a
method. Input and output get wrapped up into some discussion of the user
interface. I'm going to need a broader template than before. Also, I continue
to see that when I write code I come up with flow control that the pseudocode
did not anticipate


What are the tradeoffs of using Arrays and Hashes for this challenge?

The Hash structure was much better because our items were strings and could be
keys, so storing and accessing information was much easier in a Hash.


What does a method return?

Whatever you want, or nothing? Literally it returns whatever follows the
`return` command (explicit return), or the evaluation of the last line
evaluated in the method (implicit return, a Ruby staple). But what the method
returns may not even be used. For example, in this program nothing is returned
by any of the methods. They all take actions (like puts) and/or make changes
directory to the global variable $grocery_list. We could have had the list as
an argument to the methods and returned its value to the main program, but in
this case that would be unduly complicated. Many methods are ask just to do
something, starting with the most elementary method that just `puts "Arf!"`


What kind of things can you pass into methods as arguments?

Any object can be passed as an argument, but the method has to be expecting
that class of object or at least be able to adapt to the type of object
passed. Since everything in Ruby is an object, this is clearly a broad answer!


How can you pass information between methods?

We used two techniques in this exercise. You can pass information into a
method by using arguments to that method, and as other exercises this week
showed, that can result in changes to a variable if the method is destructive.
In this exercise we found it useful to simply define the grocery list hash as
a global variable so it could be used and changed by all the methods.


What concepts were solidified in this challenge, and what concepts are still confusing?

This was my first use of a global variable, since it was the first time we
really had a program with multiple methods where scope of variables mattered.

=end