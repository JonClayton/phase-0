# Research Methods

# I spent [] hours on this challenge.

i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Ditto" => 3, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
	source.select{|item| item.to_s.include?(thing_to_find)}
end

def my_hash_finding_method(source, thing_to_find)
	source.select{|pet,age| age == thing_to_find}.keys
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#

# Person 2
def my_array_modification_method!(source, thing_to_modify)
	source.each_with_index {|item, i| item.is_a?(Integer) && source[i] += thing_to_modify}
end

def my_hash_modification_method!(source, thing_to_modify)
	source.each_key {|pet| source[pet] += thing_to_modify}
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 3
def my_array_sorting_method(source)
	source.sort {|a,b| a.to_s <=> b.to_s}
end

def my_hash_sorting_method(source)
  	source.to_a.sort{|a,b| a[1] <=> b[1]}
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#

# Person 4
def my_array_deletion_method!(source, thing_to_delete)
  source.delete_if{|word| word.to_s.include?(thing_to_delete)}
end

def my_hash_deletion_method!(source, thing_to_delete)
  source.delete(thing_to_delete)
  source
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 5
def my_array_splitting_method(source)
  source.partition{|element| element.is_a?(Integer)}
end

def my_hash_splitting_method(source, age)
	source.to_a.partition{|element| element[1] <= age}
end

# Identify and describe the Ruby method(s) you implemented.
# #partition -- makes two arrays from one, placing elements that satisfy boolean into the first array, all others into the second array.
# #to_a -- makes an array out of the elements of a hash
#


# Release 1: Identify and describe the Ruby method you implemented. Teach your
# accountability group how to use the methods.
# #partion works elegantly to separate a set of values into two array.
# All you need it a boolean to sort by and use the familiar {|element| expression}
# that we've seen with #map/#collect.
#


# Release 3: Reflect!
# What did you learn about researching and explaining your research to others?
# I love researching to find just the right method from Ruby's rich assortment.
# I think explaining is all about illustrating the use of methods, ideally in a
# way that prove the method is useful to the audience. A written description is 
# otherwise unlikely to receive enough focus to sink in.
