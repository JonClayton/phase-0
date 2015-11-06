# Your Names
# 1) Jon Clayton
# 2) Van Phan 

# We spent [#] hours on this challenge.

# Bakery Serving Size portion calculator.

# def serving_size_calc(item_to_make, order_quantity)
#   # this number of servings provided per recipe
#   library = {"cookie" => 1, "cake" =>  5, "pie" => 7}
#   # need to replace this method of comparing input to library keys and generating error message if needed through line 23
  
#   error_counter = 3

#   library.each do |food|
#     if library[food] != library[item_to_make]
#       p error_counter += -1
#     end
#   end

#   if error_counter > 0
#     raise ArgumentError.new("#{item_to_make} is not a valid input")
#   end
#   # how many servings from one batch---need to clean up code
#   # Calculate how many full batches are needed to meet order requirement
#   # calculate how many leftover servings will be generated
#   # report above in sentence format
#   # example: p serving_size_calc("pie", 15) #=> "Make 3 pies.  You will have 6 servings left over, which is equivalent to 0 pies, 1 cake, and 1 cookie."
  
#   serving_size = library.values_at(item_to_make)[0]
#   serving_size_mod = order_quantity % serving_size

#   case serving_size_mod
#   when 0
#     return "Calculations complete: Make #{order_quantity/serving_size} of #{item_to_make}"
#   else
#     return "Calculations complete: Make #{order_quantity/serving_size} of #{item_to_make}, you have #{serving_size_mod} leftover ingredients. Suggested baking items: TODO: MAKE THIS FEATURE"
#   end
# end

#Refactored version

def serving_size_calc(item_to_make, servings_needed)

  library = {"cookie" => 1, "cake" =>  5, "pie" => 7}

  raise ArgumentError.new("#{item_to_make} is not one of our items.  Please enter one of them #{library.keys}.") unless library[item_to_make]
  
  #How many of the item ordered are required?
  servings_per_batch = library[item_to_make]
  full_batches_needed = servings_needed / servings_per_batch
  
  #Did we meet servings_needed exactly or do we need more food?
  extra_servings_required = servings_needed % servings_per_batch
  leftover_servings = servings_per_batch - extra_servings_required
  
  #How to cover shortage if we don't make an extra of the desired item
  cake_possible = extra_servings_required >= library["cake"]
  cookies_offered = extra_servings_required % library["cake"]
  
  #generate response text for main order
  result = "Make #{full_batches_needed} #{item_to_make}#{full_batches_needed > 1 ? "s" : ""} to serve #{full_batches_needed * servings_per_batch} servings."
  
  #generate text needed if the main order doesn't cover servings_needed exactly
  if extra_servings_required > 0
    extra_result = " This will leave you short #{extra_servings_required} servings.  You can either prepare an additional #{item_to_make}, with #{leftover_servings} servings left over, or you could make"
    cake_result = "#{cake_possible ? " a cake" : ""}"
    case cookies_offered
      when 0
      cookie_result = ""
      when 1
      cookie_result = " 1 cookie"
    else 
      cookie_result = " #{cookies_offered} cookies"
    end
    connector = cake_result == "" || cookie_result == "" ? "" : " and"
    closing_result = " so those people will have something to eat even if it is not the preferred item."
    result = result + extra_result + cake_result + connector + cookie_result + closing_result
  end
  return result
end

p serving_size_calc("pie", 7)
p serving_size_calc("pie", 8)
p serving_size_calc("cake", 5)
p serving_size_calc("cake", 7)
p serving_size_calc("cookie", 1)
p serving_size_calc("cookie", 10)
p serving_size_calc("THIS IS AN ERROR", 5)

=begin
##  Reflection
###What did you learn about making code readable by working on this challenge?
That my bad code is nowhere near as bad as it could be! More seriously, this points out the advantages of clear, concise code and unambigous descriptive variables.

###Did you learn any new methods? What did you learn about them?
This is not a method-intensive challenge. My pair did teach me `#has_key` but ultimately using the truthiness of `hash_name[item]` as a boolean for whether the item is an existing key was more elegant.

###What did you learn about accessing data in hashes? 
Nothing. Hash access in this challenge had already been covered by previous challenges.

###What concepts were solidified when working through this challenge?
It is really important to understand what the output is supposed to be. In this challenge the old code was so unclear that I was confused about what the output was supposed to be telling the user. In the real world one would detinitely want to talk to the users to find out what they expect from the program rather than assuming the program is delivering it and that you understand it.

=end
