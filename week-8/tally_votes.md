I'm using Markdown for this submission to make it easier to read.  The `tally_votes.js` file is [here]( ).

Here is our code.  
```ruby
function tally(votes) {
  for (var voter in votes) {
    for (var office in votes[voter]) {
      if (voteCount[office][votes[voter][office]] == undefined) {
        voteCount[office][votes[voter][office]] = 0
      }
      voteCount[office][votes[voter][office]] += 1;
    }
  }  
};

tally(votes);

function officeMaker (voteCount) {
  for (var office in voteCount) {
    for (var candidate in voteCount[office]) {
      if (officers[office] == undefined) {officers[office] = candidate};
      if (voteCount[office][candidate] > voteCount[office][officers[office]]) {
        officers[office] = candidate;
      }
    }
  }
}

officeMaker(voteCount);
```

###Reflection
####What did you learn about iterating over nested objects in JavaScript?
I learned that the iteration in a  `for .. in` loop is over the list of property names, not the entire element in the parent object.  This is annoying since you then can't use the `|key,value|` approaches you could use in Ruby, so it is harder to refer to what you want from the element.

####Were you able to find useful methods to help you with this?
No.  The nested `for..in` loops are very efficient by themselves. We did not use ANY methods or functions, only comparison and arithmetic operators.

####What concepts were solidified in the process of working through this challenge?
It was all about loops and how to refer to nested object properties and values.
