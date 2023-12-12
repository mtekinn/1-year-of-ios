
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

