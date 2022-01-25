import Cocoa

// *****************************************************
// ******************  DAY 1  **************************
// *****************************************************

//Variables - use keyword var
//Constants use the keyword 'let' - constants never change and won't let us change it
let char = "hello"
var playerName = "Roy"
playerName = "Danny"

//------------ Strings ------------
//Quotes inside strings can be scaped with backslash \"quote\"
//Lenght of strings with .count method
print(playerName.count)   //5
//UpperCase - .uppercased()
playerName.uppercased()  //DANNY
//HasPrefix - to know if string starts with string of our choosing.
let movie = """
A day in
the life of an
Apple engineer
"""
movie.hasPrefix("A day")


//------------ INTEGERS ------------
//numbers can also be separated with _ To be easier to read.
var score = -9_400.4
score += 100        //compund assigned opeartors.
 
//isMultiple(of: _) - to know if a num is multiple.
let number1 = 120
number1.isMultiple(of: 3)

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
filename.hasSuffix(".jpg")
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




// *****************************************************
// ******************  DAY 3  **************************
// *****************************************************

//Arrays - Collection of values that are stored as a single value.
var scores  = Array<Int>()
var albums = [String]()
var beatles = ["John", "Paul", "George", "Ringo"]
let nums = [2,6,3,5,7,23,1]
//.append - adding a value to the end or array .
beatles.append("Adrian")
//.count - to know how many items in array
nums.count
//.remove - remove items from array
beatles.remove(at: 2)
beatles.removeAll()
//.contains - to know if array contains item
nums.contains(4)
//SORT
nums.sorted()
//REVERSE
nums.reversed()
//Sets - like arrays but unordered and unique values.
let colors = Set(["red", "green", "blue"])

// DICTIONARIES
// Elements in dictionary are optional because the data might or might not be there.
var heights = [String:Int]()
heights["Yao Ming"] = 229
heights["Shaq"] = 216

var employee = ["name":"Taylor", "job":"Singer"]
// Default values - We can have default values if the value of a key is not in dic
print(employee["name", default: "Unknown"])
//we can also use the methods from arrays like count and removeAll.
employee.keys.contains("Taylor")
employee.values.contains("Taylor")
employee.removeValue(forKey: "name")

//SETS - Unordered with unique values.
// We don't append, but instead insert.
// Very fast to locate items. (contains, count and sorted)
var actors = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
actors.insert("Kiano Reeves")
print(actors)

//ENUM - Set of enumerated values that we can use in our code.
//Safe for us to work with and fast for swift. can use .case after first declaration.
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
enum months {
    case january, february, march, april, may
}
var day = Weekday.monday
day = Weekday.friday
var month = months.april
month = .january
print(month)


// *****************************************************
// ******************  DAY 4  **************************
// *****************************************************

//TYPE ANNOTATIONS: All of these are the same
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

//When to use type annotations? One ex. is constants that don't have value yet.
//Use type inference as much as possible, when swift decides or clues = [String]()
//GOLDEN RULE: Swift must know at all types what kind of data type you're using for your vars.

//Sumary Complex data
//Arrays are always of one specific type.
//Array methods: count, indexOf
var numss = [Int](repeating: 10, count: 5)
numss.insert(4, at: 0)
numss.first
numss.append(2)
numss.last
numss.remove(at: 3)
numss.removeLast()
numss.sorted()
numss.reversed()

var numbers = [1,2,3,4]
let doubled = numbers.map{ $0 * 2}
print(doubled)
let singers = ["John", "Paul", "George"]
let uppercased = singers.map{ $0.uppercased() }
print(uppercased)
//Dictionaries: store many values, and read them using keys we specify.
let results = ["Meghan": 80, "Chris": 90, "Charlotte": 95]
let formattedResults = results.mapValues{ "Score: \($0) "}
print(formattedResults)
//.merge and .merging
//merge() - merges one dictionary with another in place
//merging() – merge both dictionaries and returns a new dictionary.
var hexColors1 = ["red": "#ff0000", "green": "#00ff00"]
let hexColors2 = ["blue": "#0000ff"]
hexColors1.merge(hexColors2) { (_, second) in second }
// Group sequences - Dictionary(grouping:)
let conferences = ["AltConf", "App Builders", "NSSpain"]
let alphabetical = Dictionary(grouping: conferences) { $0.first! }
print(alphabetical)
let length = Dictionary(grouping: conferences) { $0.count }
print(length)
//Filtering data
let passes = results.filter { key, value in
    return true
}
print(passes)
//.reserveCapacity(50) - reserves enough space to hold 50 items.

//Sets: stores the items in a highly optimized way but unordered.

//Enums create your own types to specify a range of acceptable values.

//Swift uses type inference to figure what data we're storing.
//It's also possible to use type annotation to force a particular type (within reason)



//------------ CHECKPOINT 2:  ------------
//Create an array of strings, then write some code that prints the number items in the array and also the number of unique items in the array.
var collections: [String] = ["arrays", "dictionaries" , "sets"]
collections.append("arrays")
collections.append("dictionaries")
collections.append("sets")
collections.append("enums")
print(collections)
print("The array of strings contains \(collections.count) items.")
var unique = Set(collections)
print("Collections have \(unique.count) unique items.")

collections+=["chela"]
print(collections)

// *****************************************************
// ******************  DAY 5  **************************
// *****************************************************

// IF STATEMENTS ---------------------
//order of efficiency with strings
//Bad -> if username.count = 0
//Fair -> if username == ""
//Better -> if username.isEmpty == true
//Best -> if username.isEmpty { ... }
// SWITCH STATEMENT -------------------
/*
 There is no break statement, it does it by itself.
 switch place {
 case 1:
    fallthrough //if case 1 matched and continues to match the next one.
 case 2:
 default "if not matched"
 }
 */

