I'm keeping this file in this format to make it easier to access my comments, especially the comparison between Ruby and JS.

###Introduction
####Did you learn anything new about JavaScript or programming in general?
I enjoyed reading about the origins of programming and the explication of a crude binary program.  All the history of JavaScript was also new to me (or it was the first time I read this book last summer).

####Are there any concepts you feel uncomfortable with?
Nope. Ready to go!

###Ch. 1: Values, Types, and Operators
####Identify two similarities and two differences between JavaScript and Ruby syntax with regard to numbers, arithmetic, strings, booleans, and various operators.  
Comparison operators (||, &&) and ternary formats are reassuringly identical across both languages, as are booleans (e.g. >=) and arithmetic operators other than division (`x/y`).  

The default division operation is floating point in JavaScript, so Ruby: `puts 5/2 => 2`, JS: `console.log(5/2) => 2.5`.  Also, Javascript treats Infinity as a result in division, so Ruby: `puts 5/0` generates a zero division error, JS: `console.log(5/0) => Infinity`.

###Ch. 2: Program Structure
####What is an expression?
A fragment of code that produces a value.

####What is the purpose of semicolons in JavaScript? Are they always required?
Semicolons mark the end of a statement.  The author acknowledges that they are not always required but say the rules regarding that are so complex it is not worth trying to describe them correctly at this time. My understanding is that the semicolon can be omitted when other punctuation shows the end of the statement.  For example the last statement within a function definition doesn’t need a semicolon because the closing brace at the end of the definition tells the compiler that the statement is also complete.

####What causes a variable to return undefined?
Not division by zero, oddly enough and as mentioned above.  Instead `undefined` is the value of a variable that has not had a value assigned to it.  In Ruby you would get `nil`

####Write your own variable and do something to it in the eloquent.js file.
```javascript
var name = "Jon"
console.log(name)
```

####What does console.log do and when would you use it? What Ruby method(s) is this similar to?
`console.log()` is the basic output function in JavaScript, akin to `puts` in Ruby.  Each of them displays the argument to the function/method in the default simple interface (something like a command line, typically).

####Write a short program that asks for a user to input their favorite food. After they hit return, have the program respond with "Hey! That's my favorite too!" (You will probably need to run this in theChrome console (Links to an external site.) rather than node since node does not support prompt or alert). Paste your program into the eloquent.js file
```javascript
var food = String(prompt("What is your favorite food", "..."));
alert("Hey! That's my favorite too!");
var response ="Really! My favorite food is " + food + ", I'm serious";
alert(response);
```

####Describe while and for loops
A `while	` loop repeats as long as the condition is met.  Syntax in JavaScript is `while (condition) {block}` Note that the braces are optional if there is only one statement, much like the format changed in Ruby when the whole block fit on one line

A for loop repeats once for each value in the `for` list (the list can be expressed in various ways).  Javascript can handle `for` quite a bit differently than Ruby does, with up to three statements following the `for` and describing the “state” of the loop, including in order the start value of the recurring number, the point at which the loop will stop, and the formula to update the recurring number.  An example might help:
```javascript
var arr = [];
console.log(arr);
for(var i=1; i<=10; i+=1){arr.push(i)};
console.log(arr);
// -> Array [] 
// -> Array [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
```

####What other similarities or differences between Ruby and JavaScript did you notice in this section?
* JavaScript has the very brief `number++`, which is the same as `number+=1`
* JavaScript’s switch/case syntax is different from Ruby’s case/when syntax because Ruby assumes you want only the block between the valid when condition and the next when condition to execute, so when it reaches the next `when` it skips to the next `end` before executing any more code, while Javascript will ignore the subsequent `case` statements and continue executing code until it encounters a `break` that will cause it to jump to the `end` of the block of code under the switch, `end` in JavaScript being a `}`.  
* JavaScript variable names are connectedCamelCase, while Ruby’s are separate_underline_words
* JavaScript comments are prefaced by // for single lines and fenced by //* and * / for multilines, as opposed to Ruby’s # and =begin, =end syntax.
* JavaScript if conditions are enclosed by parentheses, and as shown below, one line if statements have the if condition at the front, not following the code block.

I’m actually going to keep adding things to this list after chapter 2:
* Javascript will ignore the argument count mismatch errors we saw in Ruby, ignoring extra arguments and assigning undefined to missing arguments.

####Complete at least one of the exercises (Looping a Triangle, FizzBuzz, of Chess Board) in the eloquent.js file.
```javascript
var output = ""
for (var i=1;i<8;i++) {
  output = output + "#"
  console.log(output)
}

for (var i = 1; i<101; i++){
  var output = i;
  if (i%3==0) output = "Fizz";
  if (i%5==0) output = "Buzz";
  if (i%15==0) output = "FizzBuzz";
  console.log(output);
}

var size = 9;
var string1 = "", string2 = "";
for (var i=0;i<size;i++){
  if (i%2==0){
    string1 += " ";
    string2 += "#";}
  else {
    string1 += "#";
    string2 += " ";}
  }
for (var i=0;i<size;i++){
  if (i%2==0) console.log(string1);
    else console.log(string2);
      }
```
###Ch. 3: Functions
####What are the differences between local and global variables in JavaScript?
The only boundary to variable scope in the current version of JavaScript are functions.  A variable created outside of any function is a global variable, while one created inside a function is local to that function and and subfunctions contained within it.  This is acknowledged to be weird--Ruby constrains the scope of variables created within loops, for example.  The next version of JavaScript will have a `let` keyword to use instead of `var` to create local variables outside of functions but inside code blocks like those in loops.

####When should you use functions?
Functions are one of the great warrior types in the battle to be DRY.  Anytime a block of code will be used more than once, or the same actions will be taken with respect to more than one value or set of values, that block of code should be a function so it is written only once and easily edited.

Functions are also handy tools to make code readable.  If you break the big problem down into smaller problems that can be given reasonably descriptive function names, the main code becomes very readable.  Then each such function can either be written in a way that is reasonably readable or broken down again.  My personal vision of readable code is a series of functions/methods with very readable names, potentially nested, such that the functions that ultimately do the work are quite compact.  These root functions may not be easily readable, but their name is effectively a comment explaining what the function is doing well enough to give the reader hope of following the logic in the function.

####What is a function declaration?
A function declaration is the slightly shorter form of declaring a variable with a function value, removing `var` and `=`
* variable declaration:  `var myFunction = function(x,y) {code block}`
* function declaration: `function myFunction(x,y) {code block}`

####Complete the `minimum` exercise in the eloquent.js file.
```javascript
function min(x,y) {return x<y ? x : y}
```
`recursion` exercise: 
```javascript
function isEven(x) {return Math.abs(x) < 2 ? x==0 : isEven(Math.abs(x)-2)}
```
`bean counting` exercise
```javascript
function countBs(str) {
  var counter = 0;
  for (var i=0; i<str.length; i++) if (str.charAt(i)=="B") counter++;
  return counter;
}
function countChar(str, char) {
  var counter = 0;
  for (var i=0; i<str.length; i++) if (str.charAt(i)==char) counter++;
  return counter;
}
```
###Ch. 4: Data Structures: Objects and Arrays
####What is the difference between using a dot and a bracket to look up a property? Ex: `array.max` vs `array["max"]`
A dot can be used only if the property has a valid variable name (not number, not string with a space, etc.).  If you want to use a variable with value equal to the property name, you must use the bracket syntax.

####Create an object called me that stores your name, age, three favorite foods, and a quirk in your eloquent.js file.
```javascript
var me = {name: "Jon Clayton", age: 50, favorite_foods: ["etouffee", "curry", "fajitas"], quirk: "don\'t laugh out loud"}
```
####What is a JavaScript object with a name and value property similar to in Ruby?
A hash

`sum of a range` exercise
```javascript
function range(start,end,step) {
  if (step==undefined) step = (end-start)/Math.abs(end-start);
  array = [];
  do {
    array.push(start);
    start += step;
  } while (start!=end+step);
  return array;
}  
function sum(array) {
  var result = 0;
  for (var i =0;i<array.length;i++) result += array[i];
  return result;
}
```
`reverse array` exercise:
```javascript
function reverseArray(array) {
  newArray = [].concat(array);
  result = [];
  while (newArray.length > 0) result.push(newArray.pop());
  return result;
}
function reverseArrayInPlace(array) {
  len=array.length
  for (var i=0;i<=len/2;i++) {
    var hold = array[i];
    array[i] = array[len-i-1];
    array[len-i-1] = hold;
  }
}
```
`A list` exercise
```javascript
function arrayToList(array, list) {
  if (list == undefined) list = null;
  newList = {value: array.pop(), rest: list};
  return array.length == 0 ? newList : arrayToList(array,newList);
}
function listToArray(list,array) {
  if (array==undefined) array = [];
  array.push(list.value)
  return list.rest == null ? array : listToArray(list.rest, array);
}
function prepend (element, list) {
  return newList = {value: element, rest: list};
}
function nth (list, place) {
  return place == 0 ? list.value : nth(list.rest, place-1);
}
```
`deepEqual` wasn't good need to redo later.
