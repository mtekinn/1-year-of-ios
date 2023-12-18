
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


