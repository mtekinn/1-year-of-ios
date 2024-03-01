import SwiftUI
//MARK: - Day 15 Summary 3

// Topics

/*
 Properties
 Static properties and methods
 Access control
 Polymorphism and typecasting
 Closures
*/


// 1. Properties


struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}


let mehmet = Person(clothes: "T-shirts", shoes: "sneakers")
let deniz = Person(clothes: "short skirts", shoes: "high heels")
mehmet.describe()
deniz.describe()


struct User {
    var clothes: String {
        willSet {
            updateUser(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        didSet {
            updateUser(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUser(msg: String) {
    print(msg)
}

var mtekin = User(clothes: "T-shirts")
mtekin.clothes = "hoodie"


struct Triangle {
    var edges: [Int]
    var perimeter: Int {
        get {
            var result = 0
            for i in edges {
                result += i
            }
            return result
        }
    }
}

let tri = Triangle(edges: [3, 4, 5])
print(tri.perimeter)



// 2. Static properties and methods

struct PinkFloydFan {
    static var favoriteSong = "Comfortably Numb"
    
    var name: String
    var age: Int
}

let pinkFan = PinkFloydFan(name: "Mehmet", age: 24)
print(PinkFloydFan.favoriteSong)



// 3. Access control


class PrivateName {
    private var name: String?
}

let pName = PrivateName()
// pName.name // 'name' is inaccessible due to 'private' protection level


class FilePrivateClass {
    fileprivate var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

var fpClass = FilePrivateClass(number: 24)
print(fpClass.number) // 24



// 4. Polymorphism and typecasting


class Car {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func performance() {
        print("\(self.brand) has good performance.")
    }
}


class ClassicCar: Car {
    var model: Int
    
    init(brand: String, model: Int) {
        self.model = model
        super.init(brand: brand)
    }
    
    override func performance() {
        print("\(self.brand) \(self.model) has an awesome design.")
    }
}


class SportCar: Car {
    var engineHP: Int
    
    init(brand: String, engineHP: Int) {
        self.engineHP = engineHP
        super.init(brand: brand)
    }
    
    override func performance() {
        print("\(self.brand) has \(self.engineHP)hp, that's why it's fast and strong.")
    }
}


var car1 = Car(brand: "Tesla")
var car2 = ClassicCar(brand: "Mercedes", model: 1972)
var car3 = SportCar(brand: "Ferrari", engineHP: 300)

var garage: [Car] = [car1, car2, car3]


for car in garage {
    if let classicCar = car as? ClassicCar {
        classicCar.performance()
    } else {
        print("This is not classic car")
    }
}


let number = 12
let strNumber = String(number)
print(type(of: strNumber)) // String



// 5. Closures


let message = "Button pressed"

Button("Press Me") {
    print(message)
}


Button {
    print("The button was pressed")
} label: {
    Image("press-me")
}
