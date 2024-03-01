
//MARK: - Day 9 Structs, part two


// Initializers

struct User {
    var name: String
}

var user = User(name: "Mehmet")

struct User2 {
    var name: String
    
    init() {
        name = "Unknown"
        print("New user")
    }
}

var unknownUser = User2() // New user


// Referring to the current instance


struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born")
        self.name = name
    }
}


let person = Person(name: "Mehmet") // Mehmet was born


// Lazy properties**

struct StartEngine {
    init() {
        print("Engine was started.")
    }
}

struct Car {
  var power : String
  lazy var engine = StartEngine()
  
  init (power:String){
    self.power = power
  }
}

var myCar = Car(power:"542 KW")
var myCarEng = myCar.engine // Now this will happen when we want to start the engine
//Engine was started

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var mehmet = Person2(name: "Mehmet")
var mehmetsFT = mehmet.familyTree // Creating family tree!


// Static properties and methods


struct CarFactory {
    static var carCount = 0
    var power: String
    
    init(power: String) {
        self.power = power
        CarFactory.carCount += 1
    }
}

var myCar2 = CarFactory(power: "130")
var anotherCar = CarFactory(power: "320")
print(CarFactory.carCount) // 2



struct Student {
    var name: String
    static var classSize = 0
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}


let c1 = Student(name: "Mehmet")
let c2 = Student(name: "Deniz")
let c3 = Student(name: "Burak")
print(Student.classSize) // 3


struct Test {
    static var entropy = Int.random(in: 1...1000)

    static func getEntropy() -> Int {
        entropy += 1
        return entropy
    }
}

var test = Test()
let result = Test.getEntropy() // generate random number
print(result)



// Access control

struct PrivateAccessExample {
    var name: String
    private var count: Int
    
    init(name: String) {
        self.name = name
        self.count = 12
    }
}

var myPrivateAcc = PrivateAccessExample(name: "Mehmet")
// myPrivateAcc.count // return error: 'count' is inaccessible due to 'private' protection level


struct ExamplePerson {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let exampPerson = ExamplePerson(id: "2")
print(exampPerson.identify()) // My social security number is 2
// exampPerson.id = 3 // return error: 'id' is inaccessible due to 'private' protection level

