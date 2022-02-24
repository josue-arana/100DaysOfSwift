import Cocoa

// *****************************************************
// ******************  DAY 1  **************************
// *****************************************************

//Variables - use keyword var
//Constants use the keyword 'let' - constants never change and won't let us change it
/*
 let char = "hello"
 var playerName = "Roy"
 playerName = "Danny"
*/

//------------ Strings ------------
//Quotes inside strings can be scaped with backslash \"quote\"
//Lenght of strings with .count method
//print(playerName.count)   //5
//UpperCase - .uppercased()
//playerName.uppercased()  //DANNY
//HasPrefix - to know if string starts with string of our choosing.
/*let movie = """
A day in
the life of an
Apple engineer
"""
movie.hasPrefix("A day")
*/

/*//------------ INTEGERS ------------
//numbers can also be separated with _ To be easier to read.
var score = -9_400.4
score += 100        //compund assigned opeartors.
 
//isMultiple(of: _) - to know if a num is multiple.
let number1 = 120
number1.isMultiple(of: 3)
*/

/*//------------ FLOATING POINT VARIABLES ------------
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
*/

/*//------------ BOOLEANS (Jorge Bool - researching logic) ------------
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
*/

/*//------------ CHECKPOINT 1 : Celcious to Farenheit conversion ------------
//Creates a constant holding any temp in Celsius.
//Conversts that temp to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
//Prints the result showing both the Celcius and Farenheit values.

let celsius = 25.0
let fahrenheit = ((celsius * 9)/5 ) + 32
print("\(celsius)° Celsius is \(fahrenheit)° in Fahrenheit")
*/



// *****************************************************
// ******************  DAY 3  **************************
// *****************************************************
/*
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
*/

// *****************************************************
// ******************  DAY 4  **************************
// *****************************************************

//TYPE ANNOTATIONS: All of these are the same
/*
 var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
 var teams: [String] = [String]()
 var cities: [String] = []
 var clues = [String]()
 */

//When to use type annotations? One ex. is constants that don't have value yet.
//Use type inference as much as possible, when swift decides or clues = [String]()
//GOLDEN RULE: Swift must know at all types what kind of data type you're using for your vars.

//Sumary Complex data
//Arrays are always of one specific type.
//Array methods: count, indexOf
/*
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
 */

//Dictionaries: store many values, and read them using keys we specify.
/*
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
 */
//.reserveCapacity(50) - reserves enough space to hold 50 items.

//Sets: stores the items in a highly optimized way but unordered.

//Enums create your own types to specify a range of acceptable values.

//Swift uses type inference to figure what data we're storing.
//It's also possible to use type annotation to force a particular type (within reason)



/*------------ CHECKPOINT 2:  ------------
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
*/


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

// *****************************************************
// ******************  DAY 6  **************************
// *****************************************************

// LOOPS ------------------------
// For loops let us loop over arrays, sets, dictionaries and ranges.
// for name in names { ... }
// for i in 1...5 { .Inclusive example. }
// for i in 1..<5 { 1 up to 5 example, exlusive }
// for _ in 1...5 { if we dont care about the care variable }

// While loop: used for custom conditions.
// Ex: while count < 10 { .. decrese count here .. }

// Use continue to skip the current iteration and break to stop the loop at current iteration.

// DIDN'T KNOW:
// - Ternary operations WTF. What ? True : False
// - Ranges are their own data type:  let count = 1...3
// - Use random example. let ran = Int.random(in: 1...1000), decimals: Double.random(in: 0...1)
// - 0 is an even number according to swift

// *****************************************************
// ******************  DAY 7  **************************
// *****************************************************

// FUNCTIONS ------------------------
// Parameters - place holders
// Arguments - atual values being passed
// Arguments must follow the order specified in the function.
// One liner functions don't need the keyword return.
// Parameters names can be used only internally using _ before the name
// Ex. func isUppercase( _ str: String) -> Bool { ... }

// We can use one parameter for external use and one for internal use
/* Ex:
    func printTimesTable(for number: Int) {
        for i in 1...12 {
            print("\(i) x \(nuber) is \(i * number)")
        }
    }
    printTimesTable(for: 5)
 */


/* Challenge - Do two strings contain the same letters regardless of their order?
    - Should accept two string parameters
    - Return true if their letters are the same

    func sameLetters(str1: String, str2: String) -> Bool {
        str1.sorted() == str2.sorted()
    }
 */

// TUPLES ----------------------
// Can contain different data types.
// They are a set size
// Access them like user.firstName, where firstName is a key item of the tuple.
// Swift knows tuple values are inside tuple so doesn't return optionals like dictionaries.
// The dot notation prevets misspeling the keys.

/* Example:
    func getUser3() -> (firstName: String, lastName: String) {
        ("Taylor, "Swift")      //no need to include the names in return stat
    }
    let user3 = getUsers()
    //We can use destructuring too
    let (firstName, lastName) = getUser3()
    let (firstName, _ ) = getUsers3() //If we don't need second item.

    //If named parameters, we can use names.
    print("Name: \(user3.firstName) \(User3.lastName)")
    
    //or can use number order if with unnamed parameters
    print("Name: \(user3.0) \(user3.1)" )
 */

// *****************************************************
// ******************  DAY 8  **************************
// *****************************************************

//Default values for parameters -------------
// Ex. func printTimesTable( for number: Int, end: Int = 12)   // = 12 makes 12 the default value
/* func checkPwd() throws {}

// Handle Errors ------------
do {
    try checkPwd() //use try before every functions that throws.
    //We also have the unwrapped version "try!" that does NOT need a catch block.
} catch {
    
}*/

/*                  CHALLENGE 4
 The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 4. If you can’t find the square root, throw a “no root” error.
 
 SOLVED
 
 */


// *****************************************************
// ******************  DAY 9  **************************
// *****************************************************


/*  CLOSURES --------------
    Copy a function (no parenthesis () )
        Ex. let greetCopy = greetUser
    Store function return value
            let greetUserResult = greetUser()
 
    Closure: very function like without function name, just constant.
 
    Closure with no parameters:
        let sayHello = {
            print("Hi There")
        }
 
    Closure WITH parameters: inside braces and keywork in (marker, end of parameters and return type)
        let sayHello = { (name:String) -> String in
            "Hi \(name)!"
 
    We can also pass functions into other functions
        func captainFirstSorted (n1:String, n2:String) -> Bool { .. }
        let captainFirstTeam = team.sorted(by: captainFirstSorted)
 
    We can use call functions or closures inside a function.
        Ex.
            let captainFirstTeam = team.sorted(by: {(name1:String, name2:String) -> Bool in
                ...
            })
    
    let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
 
    //Short hand syntax: useful for sorted, filter and map:
        let reverseTeam = team.sorted { $0 > $1 }
        let tOnly = team.filter { $0.hasPrefix("T) }
        let uppercaseTeam = team.map { $0.uppercased() }
 */

// *****************************************************
// ******************  DAY 10  **************************
// *****************************************************

/* STRUCTS ------------------
Need mutating function to change the value of the properties in structs
 struct Employee {
     let name: String
     var vacationRemaining: Int

     mutating func takeVacation(days: Int) {
         if vacationRemaining > days {
             vacationRemaining -= days
             print("I'm going on vacation!")
             print("Days remaining: \(vacationRemaining)")
         } else {
             print("Oops! There aren't enough days remaining.")
         }
     }
 }
 var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
 archer.takeVacation(days: 5)
 print(archer.vacationRemaining)
 
 - Stored Properties
 
 - Computed Properties: calculated dynamically, every single time, must have explicit type,
 and cannot be a constant.
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
 
 //Propety Observers
    -  Swift’s property observers let us attach functionality to be run before or after a property is changed, using willSet and didSet respectively. No constants
 
    - Custom struct initializers : init, self. NOTE: All properties must have value inside init
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
 
 */



// *****************************************************
// ******************  DAY 11  *************************
// *****************************************************

/*
 // Access Control ------------------- (private)
 
 private - Don't let anything ousite the struct use this.
 fileprivate - Don't let anything outside the current file use this.
 public - Let anyone, anywhere use this.
 private(set) - Let anyone read this property, but only let internal methos write it.
 
 // Static Properties and methods ------------
 - Static means that does not belong to the instance, but belong to the object itself.
 - static methods dont need mutating.
 - useful for example data and also for structs used in all code.
 - static methods CANNOT read non-static methods.
 - non-static methods CAN read static methods.
    - self: the current value of a struct 55, "Hello", true
    - Self: the current type of struct    Int, String, Bool


struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")

struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}

 // ========================= STRUCTS SUMMARY ===============================
 - You can create your own structs by writing struct, giving it a name, then placing the struct’s code inside braces.
 - Structs can have variable and constants (known as properties) and functions (known as methods)
 - If a method tries to modify properties of its struct, you must mark it as mutating.
 -You can store properties in memory, or create computed properties that calculate a value every time they are accessed.
 - We can attach didSet and willSet property observers to properties inside a struct, which is helpful when we need to be sure that some code is always executed when the property changes.
 - Initializers are a bit like specialized functions, and Swift generates one for all structs using their property names.
 - You can create your own custom initializers if you want, but you must always make sure all properties in your struct have a value by the time the initializer finishes, and before you call any other methods.
 - We can use access to mark any properties and methods as being available or unavailable externally, as needed.
 - It’s possible to attach a property or methods directly to a struct, so you can use them without creating an instance of the struct.
 
 


// Checkpoint 6 - Structs

struct Car {
    let model: String
    let numOfSeats: Int
    private var currentGear: Int {
        didSet {
            print("Gear was \(oldValue) and now is \(currentGear)")
        }
    }
    
    init(model:String, numOfSeats:Int) {
        self.model = model
        self.numOfSeats = numOfSeats
        self.currentGear = 0
    }
    
    mutating func changeGear(_ gearChange: Int){
        
        if currentGear + gearChange < 0 {
            print("You cannot go lower than gear 0")
            return
        }else if currentGear + gearChange > 10 {
            print("This car has maximum of 10 gears")
            return
        }
        
        currentGear += gearChange
    }
}


var honda = Car(model: "Honda", numOfSeats: 4)
honda.changeGear(+1)
honda.changeGear(4)
honda.changeGear(-2)
honda.changeGear(-4)
honda.changeGear(+44)
 */

// *****************************************************
// ******************  DAY 12  *************************
// *****************************************************

/* ------------ CLASSES -------------
 Similarities:
    - You can create and name them you please
    - Add properties, methods, obeservers and access controls
    - Create custom initializers to configure new instances
 Differences:
    - (child class can inherit from parent) Make one class build upon funcionality in another class
    - (no memberwise init)Swift won't generate a memberwise initializer for class (bc of 1st point)
    - (instances are passed by reference) If you have instance of class, both copies share the same data
    - (deinitializer) We can add a deinitializer to run when the final copy is destroyed
    - (constant classes can have var changed) Constants class instances can have their variable properties changed.
 
 Overrides
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) a day.")
    }
    
    - override is not needed when the parent/child methods have diff return type or parameters.
    - 'final class' used to indicate the class will NOT have any child classes.
    - classes MUST have a custom initializer
    
 Example:
 
 class Vehicle {
     let isElectric: Bool

     init(isElectric: Bool) {
         self.isElectric = isElectric
     }
 }
 class Car: Vehicle {
     let isConvertible: Bool

     init(isElectric: Bool, isConvertible: Bool) {
         self.isConvertible = isConvertible
         super.init(isElectric: isElectric)
     }
 }
 
 Copy classes:
 

 class User {
     var username = "Anonymous"

     func copy() -> User {
         let user = User()
         user.username = username
         return user
     }
 }
 var user1 = User()
var user2 = user1  //.copy()
 user2.username = "Taylor"

 print(user1.username)
 print(user2.username)
 
 
 Deinitializers --------
 
 deinit { .... } //note: no func, no parenthesis, no return. cannot call directly
 
 
 
 /* ----------------- Checkpoint 7 ------------------ */
 
class Animal {
    var legs: Int
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    func speak(){
        print("I am a Dog")
    }
}

class Corgi: Dog {
    override func speak() {
        print("I am a Corgi!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("I am a Poole!")
    }
}

class Cat: Animal {
    var isTame: Bool
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    func speak(){
        print("I'm a cat, meow")
    }
}

class Persian: Cat {
    init() {
        super.init(isTame: true)
    }
    override func speak() {
        print("Im a Persian cat")
    }
}

class Lion {
    init() {
    }
    func speak() {
        print("Im a lion!!")
    }
}

var corgi = Corgi()
corgi.speak()
var persi = Persian()
persi.speak()
var lion = Lion()
lion.speak()
 */

//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//
//        var dict = [Int:Int]()
//        var idx = 0
//
//        for num in nums {
//            let complement = target - num
//
//            if dict.keys.contains(complement) {
//                return [ dict[complement]!, idx]
//            }
//            dict[num] = idx
//            idx += 1
//        }
//        return []
//    }
//
//let res = twoSum([2,7,4,7,8], 9)
//print(res)

// *****************************************************
// ******************  DAY 13  *************************
// *****************************************************

/*
 // ----------------------- PROTOCOLS -----------------------
    - Allow us to treat our data in more general terms.
    - Similar behavior to an abstract class, that is used as a blueprint for other structures.
    - Structures/Classes conforming to a protocol MUST implement all the functions and use any properties if specified.
    - If has more than one protocol use comma, and if you want to extend a class then list it first.
    
 
   protocol Vehicle {
     var name: String { get }
     var currentPassengers: Int { get set }
     func estimateTime(for distance: Int) -> Int
     func travel(distance: Int)
    }
 
    // OPAQUE RETURN TYPES - Keyword: SOME. like.. -> some Equitable or -> some View -> some Vehicle.
    // but swift knows which type specifically.
 
    // Extensions - let us add functionality



var quote = "  The truth is Raely pure and never simple   "

print(quote)
quote.trimmingCharacters(in: .whitespaces)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

print(quote)
quote.trim()
print(quote)
 
 
 Protocols are like contracts for code. (blueprint/abstract class)
 Opaque return types let us hide some information in our code. (some Vehicle)
 Extensions let us add functionality to extisting types. (method or computed properties)
 Protocol extensions let us add functionality to many types all at once.
 
*/


/* ----------------- Checkpoint 8 ------------------ */
/*
 Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

 A property storing how many rooms it has.
 A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 A property storing the name of the estate agent responsible for selling the building.
 A method for printing the sales summary of the building, describing what it is along with its other properties.


protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var agentName: String { get set }
    func salesSummary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    func salesSummary() {
        let summ = """
            This house has \(rooms) rooms and costs $\(cost).
                - \(agentName)
            """
        print(summ + "\n")
    }
}
struct Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    func salesSummary() {
        let summ = """
            This office has \(rooms) rooms and costs $\(cost).
                - \(agentName)

            """
        print(summ + "\n")
        
    }
}

let home = House(rooms: 3, cost: 500_000, agentName: "Sara Parker")
home.salesSummary()

let off = Office(rooms: 4, cost:  600_000, agentName: "Tony Spark")
off.salesSummary()

 */

// *****************************************************
// ******************  DAY 13  *************************
// *****************************************************


/*
  // OPTIONALS -------------
    - cannot use if let statement on non-optionals
    - cannot compare optionals with other types without unwrapping it.

            var opposites = ["Mario": "Wario" , "Luigi" : "Waluigi" ]

            if let marioOpp = opposites["Peach"] {
                print("Mario opposit is \(marioOpp)")
            } else{
                print("The optional was empty")
            }


            func square(number:Int) -> Int {
                number * number
            }

            var number: Int? = nil

            if let number = number {        //shadowing technique used when unwrapping optionals in if statements.
                print(square(number: number))
            }

    // UNWRAP OPTIONALS WITH GUARD.
                    
             var myVar: Int? = 3
             
             if let unwrapped = myVar {
                // Run if myVar has a value inside
             }
             
             guard let unwrapped = myVar else {
                // Run if myVar does NOT have a value inside
             }
             
             let new = captains["Serenity"] ?? "N/A"
             let new = captains["Serenity", default: "N/A"]
             
             let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
             let favorite = tvShows.randomElement() ?? "None"
             
             let input = ""
             let number = Int(input) ?? 0
             print(number)
             
             
             let names = ["Arya", "Bran", "Robb", "Sansa"]

             let chosen = names.randomElement()?.uppercased() ?? "No one"
             print("Next in line: \(chosen)")
             
             let captains: [String]? = ["Archer", "Lorca", "Sisko"]
             let lengthOfBestCaptain = captains?.last?.count

 */



/*
    Checkpoint 9
        write a function that accepts an optional array of integers, and returns one randomly.
        If the array is missing or empty, return a random number in the range 1 through 100.
        Only one line of code.

    Solution:
    func getRandomInt( numbers: [Int]? ) -> Int { return numbers?.randomElement() ?? Int.random(in: 1...100) }
    getRandomInt(numbers: nil)
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var dict = [Int:Int]()
        var idx = 0

        for num in nums {
            let complement = target - num

            if dict.keys.contains(complement) {
                
                return [ dict[complement, default:0] , idx]
            }
            dict[num] = idx
            idx += 1
        }
        return []
    }

let res = twoSum([4,8,4,7,8], 15)
print(res)


// *****************************************************
// ******************  DAY 16  *************************
// *****************************************************


/*
 We cannot have more than 10 elements inside an element, therefore we use group and section to go around this limitation.
 Modifying Program State
    - We use the @State in front of variables bc some of the structs like ContantView are constant.
 Binding State to user interface controls
    - We use $name when getting input data for strings.
 Creating Views in a loop
    - 
 
 
 */
