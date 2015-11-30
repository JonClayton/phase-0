function isFibonacci(num) {
  var fib1 = 0;
  var fib2 = 1;
  while (num>fib2) {
    var fibNext=fib1+fib2;
    fib1=fib2;
    fib2=fibNext;
  }
  return fib2==num;
}

console.log(isFibonacci(7));
console.log(isFibonacci(8));
console.log(isFibonacci(9));