import Cocoa


//Variables and Constants
var greeting = "Hello, playground"

//Constants use the keyword 'let' - constants never change and won't let us change it
let char = "hello"

var playerName = "Roy"
print(playerName)


playerName = "Danny"
print(playerName)

//------------ Strings ------------
//Quotes inside strings can be scaped with backslash \"quote\"
//Lenght of strings with .count method
print(playerName.count) //5
//UpperCase - .uppercased()
print(playerName.uppercased())  //DANNY
//HasPrefix - to know if string starts with string of our choosing.
let movie = """
A day in
the life of an
Apple engineer
"""
print(movie.hasPrefix("A day"))


//------------ INTEGERS ------------
//numbers can also be separated with _ To be easier to read.
var score = -9_400.4
score += 100        //compund assigned opeartors.
 
//isMultiple(of: _) - to know if a num is multiple.
let number1 = 120
print(number1.isMultiple(of: 3))

//------------ FLOATING POINT VARIABLES ------------
//Design to hold number variables in memory, moving the point around hence floating point.
//Decimals are not 100% accurate.
//We cannot mix Ints and Doubles bc Swift thinks these are totally different types of vars.
let number  = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
var c = Double(a) + b   //All of the numbers in expression need to be of the same type.

c *= 2

//swift will decide the type, we can use the numbers normal
var d = 2 + 5.4
//CGFloat - Cool Graphics... Give it double.
//Floating points are very complex numbers because they need to be stored in binary, and the language has a system to find the closest approximation. Therefore we get 3.00000000000004 which makes it very precise when doing calculations.


//------------ BOOLEANS (Jorge Bool - researching logic) ------------
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))
filename.contains(".")

//.toggle() and ! flip booleans
var isOn = true
isOn.toggle()

//String contatenation + (the plus sign)
let people = "Heaters"
let action = "hate"
let lyric = people + " gonna " + action

//String interpolation
let name = "Taylor"
let age = 25
var message = "Hello, my name is \(name) and I'm \(age)"
var exp = "5 x 5 = \(5*5)"

//------------ CHECKPOINT 1 : Celcious to Farenheit conversion ------------
//Creates a constant holding any temp in Celsius.
//Conversts that temp to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
//Prints the result showing both the Celcius and Farenheit values.

let celsius = 25.0
let fahrenheit = ((celsius * 9)/5 ) + 32
print("\(celsius)° Celsius is \(fahrenheit)° in Fahrenheit")


