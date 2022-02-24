import Cocoa

/*                  CHALLENGE 4
 The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 4. If you can’t find the square root, throw a “no root” error.
 
 */


enum rootErrors: Error {
    case noRoot
    case outOfBounds
}

func integerSqrt(_ number: Int) throws -> Int {
    
    //#2
    if number < 1 || number > 10_000{
        throw rootErrors.outOfBounds
    }
    if number == 1{
        return 1
    }
    
    for n in 2...100{
        if number/n == n {
            return n
        }
    }
    
    throw rootErrors.noRoot
}

var num = 10_000
do {
    let sqrt = try integerSqrt(num)
    print("The integer square root of \(num) is \(sqrt)")
    
} catch rootErrors.noRoot {
    print("\(num) number has no integer root")
} catch rootErrors.outOfBounds  {
    print("\(num) is out of bounds")
}

// Time Complexity: O(n)
// Space Complexity: O(1)
// By Josue Arana
