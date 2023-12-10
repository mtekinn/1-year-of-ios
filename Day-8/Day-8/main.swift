
//MARK: - Day 8 Structs


// Create a basic struct

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn Tennis"
print(tennis.name)

struct SwiftLanguage {
    var name: String
    var creator: String
    var releaseDate: Int
}

let swift = SwiftLanguage(name: "Swift", creator: "Apple", releaseDate: 2014)
print(swift.name) // Swift
print(swift.creator) // Apple
print(swift.releaseDate) // 2014


// Computed properties

struct Sport2 {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic Sport"
        } else {
            return "\(name) is not an Olympic Sport"
        }
    }
}

let checkSport = Sport2(name: "Box", isOlympicSport: true)
print(checkSport.isOlympicSport) // true


struct ProgrammingLang {
    var name: String
    var creator: String
    var isOpenSource: Bool
    
    // This value is calculated according to the other variable given
    var openSourceStatus : String{
      if isOpenSource {
        return "Yes, this language is open source"
      }else{
        return "No, sorry this language is not open source"
      }
    }
}

var lang1 = ProgrammingLang(name: "Swift", creator: "Apple", isOpenSource : true)
print(lang1.openSourceStatus) // Yes, this language is open source



// Property observers

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete.")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 70
progress.amount = 100
/*
 Loading data is now 30% complete.
 Loading data is now 70% complete.
 Loading data is now 100% complete.

 */

struct Match {
    var leftSides: String
    var rightSides: String
    var leftScore: Int {
        didSet {
            print("\(leftSides) is score now \(leftScore)")
        }
    }
    var rightScore: Int {
        didSet {
            print("\(rightSides) is score now \(rightScore)")
        }
    }
    func totalScore() {
        print("\(leftSides):\(leftScore)\n\(rightSides):\(rightScore)")
    }
}

var match = Match(leftSides: "GS", rightSides: "FB", leftScore: 0, rightScore: 0)

match.leftScore = 1
match.rightScore = 1
match.totalScore()

/*
 GS is score now 1
 FB is score now 1
 GS:1
 FB:1
 */


struct Person {
    var clothes: String {
        didSet {
            print("I'm changing to \(clothes)")
        }
    }
}

var person = Person(clothes: "t-shirt")
person.clothes = "pant" // I'm changing to pant



// Methods

struct Triangle {
    var base: Double
    var height: Double
    
    func calculateArea() -> Double {
        return (base * height) / 2
    }
}

let triangle = Triangle(base: 2.4, height: 6.6)
let resultTriangle = triangle.calculateArea()
print(resultTriangle) // 7.919999999999999


// Mutating methods

struct Person2 {
    var name: String
    
    mutating func changeName() {
        name = "Mutating String"
    }
}


var anyPerson = Person2(name: "Mehmet Tekin")
print(anyPerson.name) // Mehmet Tekin
anyPerson.changeName()
print(anyPerson.name) // Mutating String


struct CounterNum {
    var counter: Int
    
    mutating func incrementNum() {
        counter += 1
        print(counter)
    }
}

var nums = CounterNum(counter: 0)
nums.incrementNum() // 1
nums.incrementNum() // 2
nums.incrementNum() // 3

struct TimerPrint {
    var speed: Int
    mutating func accelerate() {
        speed += 11
        if speed == 22 {
            travelThroughTime()
        } else {
            print("Speed is \(speed) kmh")
        }
    }
    
    func travelThroughTime() {
        print("Where we're going we don't need roads.")
    }
}


var timerPrint = TimerPrint(speed: 0)
timerPrint.accelerate()
timerPrint.accelerate()
/*
 Speed is 11 kmh
 Where we're going we don't need roads.
 */



// Properties and methods of strings

let exampleStr = "This is an example string"
print(exampleStr.count) // Returns the length of our text
print(exampleStr.hasPrefix("string")) // Checks if it starts with the string we entered
print(exampleStr.uppercased()) // Returns the string in capital letters
print(exampleStr.sorted()) // Returns all characters in the string as an ordered list.


let song = "Shake it Off"
print(song.uppercased().contains("SHAKE")) // .contains() returns true if an array contains a specified element, false otherwise



// Properties and methods of arrays

var testArr = ["Deniz"]
print(testArr.count) // Returns the length of our array
testArr.append("RedKit") // adds an item to the array
testArr.append("Tom")
print(testArr.firstIndex(of: "Tom")!) // Returns the first index of the element in the array
print(testArr.sorted()) // sorts and returns array
testArr.remove(at: 1) // Deletes item in 1st index
print(testArr) // ["Deniz", "Tom"]

