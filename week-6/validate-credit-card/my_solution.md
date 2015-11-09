I'm submitting this in a Markdown file to make it more readable.  Here's a [link to the Ruby file](https://github.com/JonClayton/phase-0/blob/master/week-6/validate-credit-card/my_solution.rb)

Here's the refactored code.  The reflection is below.
```ruby
class CreditCard
  def initialize (card_number)
    @card = card_number.to_s.split("")
    raise ArgumentError.new("Need a 16 digit number") unless @card.size == 16
  end
  
  def double_correct_digits
    @double = @card.reverse.map.with_index {|digit, index| digit.to_i*(1+index%2)}
  end
  
  def is_sum_div_by_10?
    @double.join("").split("").map{|digit| digit.to_i}.reduce(:+) % 10 == 0
  end
  
  def check_card
    double_correct_digits
    is_sum_div_by_10?
  end  
end
```

This can be refactored further, although at the cost of readability:
```ruby
class CreditCard
  def initialize (card_number)
    @card = card_number.to_s.split("")
    raise ArgumentError.new("Need a 16 digit number") unless @card.size == 16
  end

  def check_card
  @card.reverse.map.with_index{|digit,index| digit.to_i*(1+index%2)}.join("").split("").map{|digit| digit.to_i}.reduce(:+) % 10 == 0
  end  
end
```
=begin

##Reflection
###What was the most difficult part of this challenge for you and your pair?
We got hung up a little while by a very basic error on the @start_index calcualtion that led us to be doubling the wrong numbers. Which is funny because that's actually not a required element of the solution since the card_number is required to be 16 digits.

###What new methods did you find to help you when you refactored?
We discoved there is a `#map.with_index`. It is sort of hidden under `#map` in the Array methods, where it is an example for `#map` but not a method of its own. I suppose this is because `#with_index` is actually a separate Enumerable method, which is downright weird since there is an `#each_with_index` method that is explicitly listed in the Enumerable methods. 

###What concepts or learnings were you able to solidify in this challenge?
I think we did a very nice job on readability.  We also broke the problem into pieces that resulted in compact class methods and a very clean result. It was the best work I've done with a pair and it was done quickly too.  The only post-pairing refactoring I did was to introduce the `#reverse` trick that avoids having to calculate the index number to start with and then the condensing into a single, much less readable, one expression method.