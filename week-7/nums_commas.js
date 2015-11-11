// Separate Numbers with Commas in JavaScript **Pairing Challenge**


// I worked on this challenge with: Natasha Thapliyal.

// Pseudocode

//turn integer into string
// while loop; until index is larger than length of string
// slice off last three digits
// put comma in front of them
// store in variable fromRight
// slice next three digits, put comma in front


// Initial Solution
/*
var separateComma = function(number) {
  var str = number.toString();
  
  var fromRight = str.slice(-3);
  var i = -3;
  
  while(str.length + i > 0) {
    i += -3;
    var nextThreeDigits = str.slice(i,i+3);    
    fromRight = nextThreeDigits + "," + fromRight; 
  }
  return fromRight;  
};

console.log(separateComma(153456734));
*/

// Refactored Solution and shortcuts with functions

var separateComma = function(number, method) {
  if (method==undefined) method = "long";
  switch (method) {
    case "long":
      var str = number.toString();  
      var fromRight = str.slice(-3);
      var i = -3;
      while(str.length + i > 0) {
        i += -3;
        fromRight = str.slice(i,i+3) + "," + fromRight;   
      }
      return fromRight;
    case "Intl":
      return new Intl.NumberFormat().format(number);
    case "Locale":
      return number.toLocaleString();
  }

};

var number = 153456734;

// Your Own Tests (OPTIONAL)

function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "worked correctly");
  return true;
}
var testArray = [24,1234,123456,1234567,123456789,1234567890];
var resultArray = ["24","1,234","123,456","1,234,567","123,456,789","1,234,567,890"]
var methods = ["long", "Intl", "Locale"]

for (var t=0;t<6;t++) {
  for (var m=0;m<3;m++) {
    assert(
      (separateComma(testArray[t],methods[m]) == resultArray[t]),
      (testArray[t].toString() + " with " + methods[m]+ " method failed"),
      (testArray[t].toString() + " with " + methods[m]+ " method ")
      )
  }
}

/* Reflection
####What was it like to approach the problem from the perspective of JavaScript? Did you approach the problem differently?
Pseudocoding should be pretty much the same but you have to know a little bit about how it would be easiest to do
in the language you're using.  We both thought it wasn't easy to reverse a string or array so we used an approach 
from back to front that wound up more elegant anyway since it just operated on the string and created a new string.

####What did you learn about iterating over arrays in JavaScript?
I miss `#each`. But since we didn't use an array, I learned absolutely nothing about them in this challenge!

####What was different about solving this problem in JavaScript?
We had to learn syntax for what we were doing. The basic methods were the same, though--`#slice`.  But it would have been
easier if a destructive `#slice` has been available.

####What built-in methods did you find to incorporate in your refactored solution?
I found two rather esoteric approaches that wouldn't work in the Coderpad JS environment but do work in JS.node 
```javascript
new Intl.NumberFormat().format(number)
number.toLocaleString()
```
*/