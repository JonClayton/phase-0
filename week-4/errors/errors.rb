# Analyze the Errors

# I worked on this challenge by myself.
# I spent 1 hours on this challenge.

# --- error -------------------------------------------------------

# "Screw you guys " + "I'm going home." = cartmans_phrase
cartmans_phrase = "Screw you guys " + "I'm going home."
# This error was analyzed in the README file.
# --- error -------------------------------------------------------

def cartman_hates(thing)
  while true
    puts "What's there to hate about #{thing}?"
end; end
# errors.rb:170: syntax error, unexpected end-of-input, expecting keyword_end
# This is a tricky error. The line number may throw you off.

# 1. What is the name of the file with the error?
# The error is occurring in the `errors.rb` file.
# 2. What is the line number where the error occurs?
# The error occurs at line 170
# 3. What is the type of error message?
# The error is a syntax problem
# 4. What additional information does the interpreter provide about this type of error?
# It tells us that it is expecting an `end` and didn't find it by the end of the file at line 170.
# 5. Where is the error in the code?
# In lines 13-16 there should be another end to close both the `while` loop and the method definition (`def`)
# 6. Why did the interpreter give you this error?
# The interpreter gives the error because it can't compile the cartman_hates method without an end to it.

# --- error -------------------------------------------------------

south_park = ""
# errors.rb:35:in `<main>': undefined local variable or method `south_park' for main:Object (NameError)
# 1. What is the line number where the error occurs?
# Line 35
# 2. What is the type of error message?
# Name error 
# 3. What additional information does the interpreter provide about this type of error?
# It tells us the problem is with `south_park` being undefined
# 4. Where is the error in the code?
# `south_park` needs to be assigned some value
# 5. Why did the interpreter give you this error?
# It wanted to understand what `south_park` is and couldn't

# --- error -------------------------------------------------------

def cartman(); puts "Revenge is so very, very sweet."; end
# errors.rb:50:in `<main>': undefined method `cartman' for main:Object (NoMethodError)
# 1. What is the line number where the error occurs?
# Line 50
# 2. What is the type of error message?
# No method error
# 3. What additional information does the interpreter provide about this type of error?
# It tells us cartman is the undefined method.  It knows it is a method due to the `()`.
# 4. Where is the error in the code?
# `cartman()` isn't a valid method because it hasn't been defined.
# 5. Why did the interpreter give you this error?
# It tried to call the cartman method and couldn't find it

# --- error -------------------------------------------------------

def cartmans_phrase
  puts "I'm not fat; I'm big-boned!"
end

cartmans_phrase()#'I hate Kyle')
# errors.rb:65:in `cartmans_phrase': wrong number of arguments (1 for 0) (ArgumentError)
# 1. What is the line number where the error occurs?
# Line 65
# 2. What is the type of error message?
# ArgumentError
# 3. What additional information does the interpreter provide about this type of error?
# It tells us that there is 1 argument in the method call and there should be 0.
# 4. Where is the error in the code?
# Line 69 when the method is called
# 5. Why did the interpreter give you this error?
# It went to the method and didn't know what to do with the argument 'I hate Kyle'

# --- error -------------------------------------------------------

def cartman_says(offensive_message)
  puts offensive_message
end

cartman_says "Shut up fat boy!"
# errors.rb:84:in `cartman_says': wrong number of arguments (0 for 1) (ArgumentError)
# 1. What is the line number where the error occurs?
# Line 84
# 2. What is the type of error message?
# ArgumentError
# 3. What additional information does the interpreter provide about this type of error?
# It tells us that the cartman_says method received no arguments and requires one.
# 4. Where is the error in the code?
# Line 88 when the method is called without an argument
# 5. Why did the interpreter give you this error?
# When it went to the method it realized the method requires an argument and none was provided



# --- error -------------------------------------------------------

def cartmans_lie(lie, name)
  puts "#{lie}, #{name}!"
end

cartmans_lie('A meteor the size of the earth is about to hit Wyoming', 'Kenny')
# errors.rb:105:in `cartmans_lie': wrong number of arguments (1 for 2) (ArgumentError)
# 1. What is the line number where the error occurs?
# Line 105
# 2. What is the type of error message?
# ArgumentError
# 3. What additional information does the interpreter provide about this type of error?
# cartmans_lie requires two arguments and only one was given.
# 4. Where is the error in the code?
# Line 109 where cartmans_lie is called.
# 5. Why did the interpreter give you this error?
# When it got to the method it saw that method required more arguments than call provided

# --- error -------------------------------------------------------

"Respect my authoritay!" * 5 #5 * "Respect my authoritay!"
# errors.rb:124:in `*': String can't be coerced into Fixnum (TypeError)
# 1. What is the line number where the error occurs?
# Line 124
# 2. What is the type of error message?
# TypeError
# 3. What additional information does the interpreter provide about this type of error?
# It tells us that a `*` operation must be followed by a Fixnum and there's a String
# 4. Where is the error in the code?
# Line 124
# 5. Why did the interpreter give you this error?
# You can multiply strings by a number, but not a number by a string

# --- error -------------------------------------------------------

amount_of_kfc_left = 20/10

# errors.rb:139:in `/': divided by 0 (ZeroDivisionError)
# 1. What is the line number where the error occurs?
# Line 139
# 2. What is the type of error message?
# ZeroDivisionError
# 3. What additional information does the interpreter provide about this type of error?
# It says it has to do with the `/` operator, which might be helpful if the expression were more complex
# 4. Where is the error in the code?
# Line 139, and the last character in it, which can't be zero.
# 5. Why did the interpreter give you this error?
# It tried to evaluate the expression and something divided by zero is undefined and generates an error.

# --- error -------------------------------------------------------

require_relative "cartmans_essay.rb" #fixed by creating such a file and changing extension to `.rb`
# errors.rb:155:in `require_relative': cannot load such file -- /Users/jonclayton/phase-0/week-4/errors/cartmans_essay.md (LoadError)
# 1. What is the line number where the error occurs?
# Line 155
# 2. What is the type of error message?
# LoadError
# 3. What additional information does the interpreter provide about this type of error?
# It gives us the filename and path that require_relative is trying to load
# 4. Where is the error in the code?
# It's in line 155, and I interpret it as being a missing file, though it could be something else.
# 5. Why did the interpreter give you this error?
# The interpreter tried to load the file and none existed.

=begin
# --- REFLECTION -------------------------------------------------------
# Write your reflection below as a comment.
Which error was the most difficult to read?
I found the last one hardest because I don't know much about require_relative

How did you figure out what the issue with the error was?
Explanation was reasonably clear, solution less so.
Tried creating file with that name, didn't work.
Put content into file, still didn't work.
Renamed file (and argument) to `.rb` and it worked.

Were you able to determine why each error message happened based on the code?
Yes

When you encounter errors in your future code, what process will you follow to help you debug?
Read error messages carefully!  
The missing end errors will be hard when we don't know where the problem is.
I'd try commenting out parts of code to isolate the place were the `end` is missing.

=end