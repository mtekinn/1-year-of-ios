import Foundation

//MARK: - Day 14 Summary 2

// Topics

/*
 Functions
 Optionals
 Optional chaining
 Enumerations
 Structs
 Classes
*/


// 1. Functions

func test() {
    print("Test 1")
}

test()


func tryToLearn(lang: String) {
    print("I'm learning \(lang) now.")
}

tryToLearn(lang: "Swift")


func birthLang(year: Int, name: String) {
    print("\(name) was released by Apple, in \(year)")
}

birthLang(year: 2014, name: "Swift")
birthLang(year: 1991, name: "Python")
birthLang(year: 1996, name: "Java")


func car(_ carName: String) {
    print("My favorite car is \(carName)")
}

car("Ford")


func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

countLetters(in: "Mehmet")


func pinkFloyd(name: String) -> Bool {
    if name == "Syd Barrett" { return true }
    if name == "David Gilmour" { return true }
    if name == "Bob Klose" { return true }
    if name == "Nick Mason" { return true }
    if name == "Roger Waters" { return true }
    if name == "Rick Wright" { return true }
    
    return false
}

print(pinkFloyd(name: "Mehmet Tekin")) // false
print(pinkFloyd(name: "David Gilmour")) // true


// 2. Optionals


func school(in person: String) -> String? {
    if person == "Student" {
        return "Go study more!"
    } else {
        return nil
    }
}

print(school(in: "Student")) // Optional("Go study more!")
print(school(in: "Teacher")) // nil

var schoolPerson = school(in: "Student")

if let unwrappedData = schoolPerson {
    print("unwrapped output is: \(unwrappedData)")
} else {
    print("Output is: \(schoolPerson)")
}

let student: String = "Student"
var status = school(in: student)
print("I will \(status!)") // I will Go study more!



// 3. Optional chaining


struct Person {
    var name: String
    var middleName: String?
    var surname: String
    var age: Int
    var isMarried: Bool?
}


let person = Person(name: "Mehmet", middleName: nil, surname: "Tekin", age: 24, isMarried: nil)

let userMarriedStatus = person.isMarried ?? false
print(userMarriedStatus)


// 4. Enumerations

enum WeatherType {
    case sun, cloud, rain, wind, snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    if weather == WeatherType.sun {
        return nil
    } else {
        return "Hate"
    }
}

print(getHaterStatus(weather: WeatherType.cloud)!) // Hate

enum Weather {
    case sun, cloud, rain, wind(speed: Int), snow
}

func weatherStatus(weather: Weather) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

print(weatherStatus(weather: Weather.wind(speed: 5))) // Optional("meh")


// 5. Struct

struct User {
    var name: String
    var middleName: String?
    var lastName: String
    var age: Int
    
    init(name: String, middleName: String? = nil, lastName: String, age: Int) {
        self.name = name
        self.middleName = middleName
        self.lastName = lastName
        self.age = age
    }
    
    func getFullName() {
        print("\(name) is \(age) years old.")
    }
}


let user = User(name: "Mehmet", middleName: nil, lastName: "Tekin", age: 24)
var userCopy = user
userCopy.name = "Deniz"

print(user.name) // Mehmet
user.getFullName() // Mehmet is 24 years old.

print(userCopy.name) // Deniz
userCopy.getFullName() // Deniz is 24 years old.


// 6. Classes

class UserClass {
    var firstName: String
    var middleName: String?
    var lastName: String
    var age: Int
    
    init(firstName: String, middleName: String? = nil, lastName: String, age: Int) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.age = age
    }
    
    func getFullName() {
        print("My name is \(firstName). I'm \(age) years old.")
    }
}

let userClass = UserClass(firstName: "Mehmet", middleName: nil, lastName: "Tekin", age: 24)

print(userClass.firstName) // Mehmet
print(userClass.middleName) // nil
print(userClass.lastName) // Tekin
userClass.getFullName() // My name is Mehmet. I'm 24 years old.


class Person2: UserClass, Identifiable {
    var id = UUID()
    override func getFullName() {
        print("ID :\(id) - \(firstName) - \(lastName)")
    }
}

let userClass2 = Person2(firstName: "Deniz", middleName: nil, lastName: "Tekin", age: 25)

print(userClass2.id) // random id; 3904BFE4-B8A4-4A72-AE75-6F2142B99ADB
print(userClass2.firstName) // Deniz
print(userClass2.lastName) // Tekin
print(userClass2.age) // 25


// Struct vs Classes (Value Type vs Reference Type)

/*
 *******
 When you copy a struct, the whole thing is duplicated, including all its values. This means that changing one copy of a struct doesn't change the other copies – they are all individual. With classes, each copy of an object points at the same original object, so if you change one they all change. Swift calls structs "value types" because they just point at a value, and classes "reference types" because objects are just shared references to the real value.
*******
*/
