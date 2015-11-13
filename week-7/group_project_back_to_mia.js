
// Release 2: User Stories to Pseudocode (Malia Lehrer)

// Input: An ordered list of integers
//   The tests include two lists:
var oddList = [1, 2, 3, 4, 5, 5, 7] //   An "odd list" of 7 values [1, 2, 3, 4, 5, 5, 7]
var evenList = [4, 4, 5, 5, 6, 6, 6, 7] //   And an "even list" of 8 values [4, 4, 5, 5, 6, 6, 6, 7]
// Three fucntions are needed.
// Output function 1: The sum of the list
// Output function 2: The mean of the list
// Output function 3: The median of the list

// Sum function
// Input: An ordered list of integers
function Sum(list) {
// Output: The sum of the list

// Set up a For loop
for (
// Set a variable equal to the length of the list
/////// JON SAYS: not sure this is going to work after I set up the For loop.  Crossing my fingers....
var length = list.length,
// Set a counter equal to 0
counter = 0,
// Set a sum variable = 0
total = 0; 
/////// JON SAYS: WOW, I had no idea you could put extra stuff into the for loop initialization!!!
// While the counter is less than the length of the list,
counter < length; 
//   add one to the counter each loop
counter++)
//   add the value at the counter (array[counter]) to the sum variable  
/////// JON SAYS: probably should just say the value at that index in the array...array[counter] is code......
{total += list[counter]}
// Return the value of the sum variable
return total
}
// Mean function -- Decimals are ok!
// Input: An ordered list of integers
function Mean(list) {
// Output: The mean of the list
//Set a variable equal to the length of the list
var length = list.length;
// Sum all the numbers in the array together, perhaps using the above pseudocode, or a better way if you think of one
//Divide the sum of the array by the length variable
//Return the result of this operation
return Sum(list)/length;
}
// Median function
// Input: An ordered list of integers
function Median(list) {
//Output: The median of the list, which will be the middle number in the odd list and the average of the two middle numbers in the even list

//Set a variable equal to the length of the list
var length = list.length
//Set a variable equal to the index divided by 2, rounded down (half)
/////// JON SAYS: you meant length, not index but that's just a typo
var half = Math.floor(length/2)
//If the length is not divisible by 2 (odd)
if (length % 2 != 0) {
// Return the value at the index of (half + 1)
/////// JON SAYS: Uh-oh......actually wanted half, not half+1 because indexes start at zero, so the 4th term is at index=3
return list[half+1];
}
//Else
else {
//  Set a variable equal to the value at the index of half and index
//  of (half + 1), divided by 2
// JON SAYS: uhoh, same problem....one index too high
var result = (list[half]+list[half+1])/2;
//  Return the resulting variable
return result;
}
}

////// JON SAYS: Tests
console.log(Sum(oddList));
console.log(Sum(evenList));
console.log(Mean(oddList));
console.log(Mean(evenList));
console.log(Median(oddList));
console.log(Median(evenList));