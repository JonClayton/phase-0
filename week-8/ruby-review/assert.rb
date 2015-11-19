# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself, with: ].


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
# when assert is called with a block passed to it, it will raise a generic "Assertion failed" error statement unless the block passed evaluates as true.  This is a little annoying since it provide little information on what is wrong.


# 3. Copy your selected challenge here

# I'm writing Assert into the bingo checker 2 challenge in this exercise.


# 4. Convert your driver test code from that challenge into Assert Statements





# 5. Reflection
