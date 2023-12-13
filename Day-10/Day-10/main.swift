
//MARK: - Day 10 - Classes

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person = Person(name: "Mehmet", age: 24)
print(person.name) // Mehmet
print(person.age) // 24


class VideoGame {
    var hero: String
    var enemy: String
    init(heroName: String, enemyName: String) {
        self.hero = heroName
        self.enemy = enemyName
    }
}
let monkeyIsland = VideoGame(heroName: "Guybrush Threepwood", enemyName: "LeChuck")
print(monkeyIsland.enemy) // LeChuck
print(monkeyIsland.hero) // Guybrush Threepwood



// Class inheritance


class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}


class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

let karam = Poodle(name: "Karam")
print(karam.name) // Karam
print(karam.breed) // Poodle



class Developer {
    var name: String
    var age: Int
    var programmingLang: [String]
    
    init(name: String, age: Int, programmingLang: [String]) {
        self.name = name
        self.age = age
        self.programmingLang = programmingLang
    }
}


let developer = Developer(name: "Mehmet", age: 24, programmingLang: ["Swift", "Java", "Python"])
print(developer.programmingLang) // ["Swift", "Java", "Python"]


class IosDeveloper: Developer { // Inherit from Developer Class
    init(name: String, age: Int) {
        super.init(name: name, age: 24, programmingLang: ["C", "Swift"])
    }
}

let developer2 = IosDeveloper(name: "Deniz", age: 22)
print(developer2.programmingLang) // ["C", "Swift"]



// Overriding methods

class Dog2 {
    func makeNoise() {
        print("Woof!")
    }
}

class Pomeranian: Dog2 {
    override func makeNoise() {
        print("Yip!")
    }
}

let pom = Pomeranian()
pom.makeNoise() // Yip!


class Car {
    func cars() {
        print("All cars need fuel to go!")
    }
}

let car = Car()
car.cars() // All cars need fuel to go!


class Tesla: Car {
    override func cars() {
        print("Tesla needs electricity to go!")
    }
}

let tesla = Tesla()
tesla.cars() // Tesla needs electricity to go!


// Final classes **

// When you declare a class as being final, no other class can inherit from it
// Marking class as final also tells Swift compiler that method should be called directly (static dispatch) rather than looking up a function from a method table (dynamic dispatch)*******

final class Student {
    var id: Int
    var firstName: String
    var lastName: String
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
}

let student = Student(id: 12345, firstName: "Mehmet", lastName: "Tekin")

/*
class TestFinalStudent: Student { // returns Inheritance from a final class 'Student'
    init() {
        super.init(id: 0, firstName: "TestFirstName", lastName: "TestLastName")
    }
}
*/


// Copying objects

class ProgrammingLanguage {
    var lang: String
    
    init(lang: String) {
        self.lang = lang
    }
}

var language = ProgrammingLanguage(lang: "Java")
print(language.lang) // Java

var copyLang = language
copyLang.lang = "Swift"

print(copyLang.lang) // Swift



// Deinitializers


class Product {
    var name = "House"
    
    init() {
        print("\(name) can be used.")
    }
    
    func everythingGood() {
        print("Everything is ok for \(name)")
    }
    
    deinit {
        print("\(name) was destroyed")
    }
}

for _ in 0...1 {
    let product = Product()
    product.everythingGood()
}

/*
 House can be used.
 Everything is ok for House
 House was destroyed
 House can be used.
 Everything is ok for House
 House was destroyed
 */



// Mutability
// Class is explicit about mutable items.

class Player {
    var name = "Messi"
}

let player = Player()
player.name = "Ronaldo"
print(player.name) // Ronaldo


class Singer {
    let name = "Eminem"
}

let eminem = Singer()
// eminem.name = "David Gilmour" // Cannot assign to property: 'name' is a 'let' constant
print(eminem.name) // Eminem
