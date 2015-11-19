I'm doing this in Markdown to improve readability.  The complete `.js` file can be found [here](https://github.com/JonClayton/phase-0/blob/master/week-8/gradebook.js).

Here's the refactored code:
```ruby
var gradebook = {
  addScore: function(name, score) {this[name].testScores.push(score)},
  getAverage: function(name) {return this[name].testScores.reduce( (x, y) => x + y)/this[name].testScores.length}
}

students.forEach(function(student){gradebook[student] = {testScores: scores[students.indexOf(student)]}});

//  Average function only needs to be here to pass tests 7 and 8.  We don't need it or use it otherwise.
function average(array) {return array.reduce( (x, y) => x + y)/array.length}
```
### Reflection
####What did you learn about adding functions to objects?
I saw how to do it externally, and then in the refactor figured out how to do it internally, letting me replace the object name with `this`.
####How did you iterate over nested arrays in JavaScript?
In this case I used `#forEach` and then something a bit messy to get an index number to pull from a different array at the same index. I could also have used a for loop with an explicit index number but that seemed even a bit less elegant.
####Were there any new methods you were able to incorporate? If so, what were they and how did they work?
I learned a trick, using `=>` to get rid of the `function`, `return` and '{}' in the original syntax I used for reduce.  Much shorter syntax!  Thanks Dan Anderson! 
