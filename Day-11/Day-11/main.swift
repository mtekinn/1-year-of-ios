
//MARK: - Day 11 Protocols and extensions


protocol Identifiable {
    var id: String { get set }
}


struct User: Identifiable {
    var id: String
}

func displayID(id: Identifiable) {
    print("My ID is \(id.id)")
}

displayID(id: User(id: "24"))



protocol Purchaseable {
    var name: String { get set }
}


struct Book: Purchaseable {
    var name: String
    var author: String
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

let book = Book(name: "Test", author: "Mehmet Tekin")
buy(book) // I'm buying Test


// Protocol inheritance

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {
    
}

struct Work: Employee {
    func calculateWages() -> Int {
        return 5000
    }
    
    func study() {
        print("Working")
    }
    
    func takeVacation(days: Int) {
        print("You have \(days) days vacation")
    }
}


let mehmet = Work()
print(mehmet.calculateWages()) // 5000
mehmet.study() // Working
mehmet.takeVacation(days: 20) // You have 20 days vacation



// Extensions


extension Int {
    func squared(times: Int) -> Int {
        return self * self
    }
}

let num1 = 4
print(num1.squared(times: 4))


// Protocol extensions


let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])


extension Collection {
    func summarize() {
        print("The are \(count) of us:")
        
        for name in self {
            print("\(name)")
        }
    }
}
pythons.summarize()
beatles.summarize()


// Protocol-oriented programming (POP)

protocol Identifiable2 {
    var id: String { get set }
    func identify()
}

extension Identifiable2 {
    func identify() {
        print("My ID is \(id).")
    }
}


struct User2: Identifiable2 {
    var id : String
}

let twoStraws = User2(id: "twoStraws")
twoStraws.identify() // My ID is twoStraws.

