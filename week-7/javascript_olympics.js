// JavaScript Olympics

// I paired with Chris Guest on this challenge.

// This challenge took me [2] hours.


// Warm Up

// Bulk Up

// initial solution

var win = function(array) {
	for (var i = 0;i<array.length;i++) {
		array[i].win = array[i].name + " won the " + array[i].event + "!";  
		console.log(array[i].win);
	}
} 

var athletes = [{name: "Sarah Hughes", event: "Ladies' Singles"}];
win(athletes);

// Refactored Solution: seems funny to have a function external to the object

function Athletes (name, event) {
  this.name = name;
  this.event = event;
  this.win = name + " won the " + event + "!";
}

var sarah = new Athletes("Sarah Hughes", "Ladies' Singles");

var mike = new Athletes("Mike Smith", "Men's 100m dash");

var array = [mike, sarah];

console.log(array[1].win);



// Jumble your words
// Note, solutions for this without relying on Array#reverse are in 7.2 as response to an Eloquent JavaScript exercise

var reversing = function(str){
  var result = str.split("").reverse().join("")
  console.log(result)
}

reversing("my name is Jon")

// 2,4,6,8

// initial solutions
var is_even = function(value) {
  return value % 2 == 0;
}

var filter_even = function(array_of_nums) {
  var even_nums = array_of_nums.filter(is_even);
  console.log(even_nums)
}
filter_even([1, 2, 4, 5, 8, 11])

// Refactor, after figuring out the syntax to get the boolean embedded

var filter_even2 = function(array_of_nums) {
	var even_nums = array_of_nums.filter(function(item) {return item % 2 ==0})
    console.log(even_nums)
}
filter_even2([1, 2, 4, 5, 8, 11])


// "We built this city"

function Athlete(name, age, sport, quote) {
  this.name = name;
  this.age = age;
  this.sport = sport;
  this.quote = quote;
  this.report = [name, sport, quote].join(" ");
}

var michaelPhelps = new Athlete("Michael Phelps", 29, "swimming", "It's medicinal I swear!")
console.log(michaelPhelps.constructor === Athlete)
console.log(michaelPhelps.name + " " + michaelPhelps.sport + " " + michaelPhelps.quote)
console.log(michaelPhelps.report)

/* Reflection

####What JavaScript knowledge did you solidify in this challenge?
I got more agile in using object properties, realized there actually is a reverse function for JS arrays, dealt with how frustrating the syntax is for `Array#filter` and just now as I was researching remembered/realized there is an `Array.forEach` function that is like Ruby `Array#each` and is about to make life easier. I wonder why Eloquent JavaScript hasn't introduced it in the first four chapters.

####What are constructor functions?
Constructor functions build JS objects by taking in arguments and assigning them as values to predefined properties.

####How are constructors different from Ruby classes (in your research)?
There are some little differences (`new` is an operator in JS, a method in Ruby), and I think a philosophical difference in that Ruby built-in classes come with a wide set of built-in methods, while JS doesn't provide a variety of native object types, so your constructor function would have to provide all the methods you want, perhaps within Prototype, something we haven't yet covered so I won't dwell on it.

*/