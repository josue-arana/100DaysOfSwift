import Cocoa

// *****************************************************
// ******************  FIZZBUZZ  ***********************
// *****************************************************

/*
 Loop from 1 through 100 and for each number:
    If it’s a multiple of 3, print “Fizz”
    If it’s a multiple of 5, print “Buzz”
    If it’s a multiple of 3 and 5, print “FizzBuzz”
*/

for i in 1...100 {
    
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("\(i) FizzBuzz")
    }
    else if i.isMultiple(of: 3){
        print("\(i) Fizz")
    }
    else if i.isMultiple(of: 5){
        print("\(i) Buzz")
    }
}

/*
 COMPLEXITIES:
 Time Complexity O(n)
 Space Complexity O(1)
*/
