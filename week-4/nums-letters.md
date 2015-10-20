##What does puts do?
`puts` is the most often used (at least in tutorial) output command in Ruby. It prints what follows it to the console (your screen), and advances to the next line. `print` prints, but doesn't advance to the next line. `p` prints and returns the result of the line. This will be important later, I suspect, but right now it seems to me that returning the result of a method and printing it to the screen are not something I'd want to do at the same time.

##What is an integer? What is a float?
An integer is a "round" or "whole" number, meaning one with no decimal or fractional component. A float is a floating point number, meaning that it can have numbers to the right of the decimal point.

##What is the difference between float and integer division? How would you explain the difference to someone who doesn't know anything about programming?
Float division looks "right." Integer division often looks wrong. Integer division returns the result as an integer, and it "rounds down" so at first glance it appears to be rounding incorrectly. For example, in float division `9/5 => 1.8`. In integer division `9/5 => 1`. What's really happening is integer division results in an integer quotient and a remainder, and the basic division operation on integer variables returns only the quotient. In Ruby you can use the following methods for integer division:
```ruby
9/5 => 1
9.divmod(5) => [1,4]
9.modulo(5) => 1
9.remainder(5) => 4
```