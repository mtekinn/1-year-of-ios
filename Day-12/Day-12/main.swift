//MARK: - Day 12 Optionals


// Handling missing data

var age: Int? = nil

age = 22
print(age) // Optional(22)


// Unwrapping optionals

var name: String? = nil

if let unwrapped = name {
    print(unwrapped.count)
} else {
    print("Empty")
} // It returns "Empty" because name is nil


// Unwrapping with guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!") // this line will works
        return
    }
    print("Your name is \(unwrapped)") // this line won't work when you fill in the name incorrectly
}

var greetName = greet(nil)


// Force unwrapping

let str = "12"
let num = Int(str)

print(num) // Optional(12)
print(num!) // 12

// if you’re wrong if str was something that couldn't be converted to an integer, the code would crash
// As a result, we should force unwrap only when you’re sure it’s safe.



enum Direction: CaseIterable {
    case north, south, east, west

    static func random() -> Direction {
        Direction.allCases.randomElement()!
    }
}

let rando = Direction.random()
print(rando)


// Implicitly unwrapped optionals

// You can think of it as forcing a value unwrapping, but it does this without using "if let" or "guard let"

var firstName: String! = nil


// Nil coalescing

func username(for id: Int) -> String? {
    if id == 1 {
        return "David Gilmour"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Unknown"
print(user) // Unknown



// Optional chaining

var names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
print(beatle!) // JOHN

names.removeAll()
let beatle2 = names.first?.uppercased()
print(beatle2) // nil


let names2 = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = names2["Tekin"]?.first?.uppercased() ?? "?"
print(surnameLetter) // returns "?"


// Optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password")
}

// You can't use that password

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

// D'oh.

try! checkPassword("test")
print("OK!")

// OK!


// Failable initializers


struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let person = Person(id: "test")
print(person) // nil


// Typecasting

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}


let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

// Woof!
