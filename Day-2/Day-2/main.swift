
//MARK: - Day-2

// Arrays

let name1 = "Mehmet"
let name2 = "Tekin"
let name3 = "Ali"
let name4 = "Deniz"

let names = [name1, name2, name3, name4]
print(names) // ["Mehmet", "Tekin", "Ali", "Deniz"]
print(names[1]) // Tekin

// Sets

let colors = Set(["red", "green", "blue"]) // ["red", "green", "blue"]
let colors2 = Set(["red", "green", "blue", "red", "blue"]) // ["red", "green", "blue"]

// Tuples

var name = (first: "Mehmet", last: "Tekin")
print(name.0) // Mehmet
print(name.first) // Mehmet

// Dictionaries

let heights = [
    "Mehmet": 1.83,
    "Burak": 1.87
]

print(heights["Mehmet"]!) // 1.83
print(heights.keys) // ["Burak", "Mehmet"]
print(heights.values) // [1.87, 1.83]
print(heights["Deniz"]) // nil
print(heights["Ahmet" ,default : 0.0]) // 0.0
print(heights["Deniz"] ?? 0.0) // 0.0


// Creating empty collections

// Create empty Dictionary
var teams = [String: String]()
var hair = Dictionary<String, String>()
teams["Mehmet"] = "Yellow"
hair["Burak"] = "Black"
print(teams) // ["Mehmet": "Yellow"]
print(hair) // ["Burak": "Black"]

// Create empty Array
var numbers = Array<Int>()
var result = [Int]()

// Create empty Set
var words = Set<String>()
var numbers2 = Set<Int>()

// Enumerations

let result2 = "success"
let result3 = "failure"

enum Result {
    case success
    case fail
}

let goodResult = Result.success
print(goodResult) // success


// Enum associated values

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "basketball")
print(talking) // talking(topic: "basketball")

enum Weather {
    case sunny(heat: Double)
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}

var weatherRes = Weather.sunny(heat: 14.5)

print(weatherRes) // sunny(heat: 14.5)

enum Results {
    case wait
    case success(description: String)
    case fail(errorCode: Int)
}
let problem = Results.fail(errorCode : 404)
print(problem) // fail(errorCode: 404)

// Enumerations Raw Values

enum Days: Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

let today = Days(rawValue: 2)
print(today) // Optional(Day_2.Days.tuesday)


// Tips for Sets
// The objects in the set are unique
let uniqueObjects = Set(["Swift", "Python", "Java"])

// Tips for Tuples
// Tuple types cannot be changed, values can be changed
var person = (name: "Mehmet", surname: "Tekin")
// var person = (name: "Mehmet", age: 24) // its return error "Invalid redeclaration of 'person'"
var person2 = (name: "Mehmet", age: 24)
print(person2.1) // 24

person2.age = 25
print(person2.1) // 25
