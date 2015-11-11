// Separate Numbers with Commas in JavaScript **Pairing Challenge**


// I worked on this challenge with: .

// Pseudocode



// Initial Solution




// Refactored Solution




// Your Own Tests (OPTIONAL)




// Reflection

// Pseudocode
//turn integer into string
// while loop; until index is larger than length of string
// slice off last three digits
// put comma in front of them
// store in variable fromRight
// slice next three digits, put comma in front


// Initial Solution

var separateComma = function(number) {
  var str = number.toString();
  
  var fromRight = str.slice(-3);
  var i = -3;
  
  while(str.length + i > 0) {
    i += -3;
//    var nextThreeDigits = str.slice(i,i+3) + ",";
    
    fromRight = str.slice(i,i+3) + "," + fromRight;
    
  }
  
  return fromRight;
  
};

console.log(separateComma(153456734));

// Refactored Solution

var separateComma = function(number) {
  var str = number.toString();
  
  var fromRight = str.slice(-3);
  var i = -3;
  
  while(str.length + i > 0) {
    i += -3;
    fromRight = str.slice(i,i+3) + "," + fromRight;   
  }
  
  return fromRight;
  
};