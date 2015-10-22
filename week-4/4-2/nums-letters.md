##What does puts do?
Does your grammar check flag the mixup in singular and plural this question seems to have? :0)
`puts` is the most often used (at least in tutorial) output command in Ruby. It prints what follows it to the console (your screen), and advances to the next line. `print` prints, but doesn't advance to the next line. `p` prints and returns the result of the line. This will be important later, I suspect, but right now it seems to me that returning the result of a method and printing it to the screen are not something I'd want to do at the same time.

##What is an integer? What is a float?
An integer is a "round" or "whole" number, meaning one with no decimal or fractional component. A float is a floating point number, meaning that it can have numbers to the right of the decimal point. The terms can also, I suspect, be applied to integer variables and floating point variables, which are constrained in the way these terms suggest, though there is some nuance about the level of precision in both.

##What is the difference between float and integer division? How would you explain the difference to someone who doesn't know anything about programming?
Float division looks "right." Integer division often looks wrong. Integer division returns the result as an integer, and it "rounds down" so at first glance it appears to be rounding incorrectly. For example, in float division `9/5 => 1.8`. In integer division `9/5 => 1`. What's really happening is integer division results in an integer quotient and a remainder, and the basic division operation on integer variables returns only the quotient. In Ruby you can use the following methods for integer division:
```ruby
9/5 => 1
9.divmod(5) => [1,4]
9.modulo(5) => 1
9.remainder(5) => 4
```

##How does Ruby handle addition, subtraction, multiplication, and division of numbers?
Not sure what is meant by this. Ruby allows the use of the +-*/% operators on integers and other numeric classes.

##What is the difference between integers and floats?
I'm just copying my answer from above! An integer is a "round" or "whole" number, meaning one with no decimal or fractional component. A float is a floating point number, meaning that it can have numbers to the right of the decimal point. The terms can also, I suspect, be applied to integer variables and floating point variables, which are constrained in the way these terms suggest, though there is some nuance about the level of precision in both.

##What is the difference between integer and float division?
Integer division returned the quotient rounded down to an integer. It is not a separate function, but the result if you use the division operator '/' on integer variables. I personally find the result terribly unintuitive, and it means care is required anytime you use the division operation to make sure your result is what you expect. If I were writing a language I would have the '/' operator automatically return a float if the result of the division is not an integer, and provide a different method for the "quotient and remainder" result. Which Ruby does, of course, with 'a.divmod(b), which returns an array with the integer quotient and the remainder or modulus.

##What are strings? Why and when would you use them?
Strings are variables that are made up of characters rather than numbers. They are handy for lots of reasons and there are many useful methods for dealing with them. Until humans communicate in binary, we're going to continue to need string variables.

##What are local variables? Why and when would you use them?
Local variables are those that are not used throughout the program. They are instead limited to the branch of the program in which they are created. They are useful because the program can use them and not have to worry about whether they are used again in some other part of the program. One good example is index variables in loops. It would be a royal pain in the @$$ to have to come up with a unique index for every such loop. It's also helpful because it makes code more modular, allowing you to freely import methods and subroutines from other programs without worrying much about variable name conflicts.

##How was this challenge? Did you get a good review of some of the basics?
I was very overprepared for my interview so this was very basic. I wonder how common that perception is.

##Links to challenge solutions, and since they are short, the solutions themselves:

[4.2.1 Defining Variables](https://github.com/JonClayton/phase-0/blob/master/week-4/defining-variables.rb) 
```ruby
first_name="John"
last_name="Kennedy"
age=98
```

[4.2.2 Simple String](https://github.com/JonClayton/phase-0/blob/master/week-4/simple-string.rb)
```ruby
old_string="Ruby is cool"
new_string=old_string.reverse.upcase
```

[4.2.3 Basic Math](https://github.com/JonClayton/phase-0/blob/master/week-4/basic-math.rb)
```ruby
num1=8675309
num2=16

sum=num2+num1
difference=num1-num2
product=num1*num2

quotient=num1.to_f/num2.to_f
#The below return the integer quotient (e.g. the above result rounded down)
#quotient=num1/num2
#quotient=num1.div(num2)
#quotient=num1.divmod(num2)[0]

#all of the below return the same
modulus=num1%num2
modulus=num1.modulo(num2)
modulus=num1.divmod(num2)[1]
```
