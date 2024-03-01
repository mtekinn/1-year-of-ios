//MARK: - Day 3 Operators and conditions

let firstScore = 18
let secondScore = 6

let total = firstScore + secondScore // 24
let difference = firstScore - secondScore // 12

let product = firstScore * secondScore // 108
let divided = firstScore / secondScore // 3

let remainder = 17 % secondScore // 5


// Operator Overloading

let num1 = 11
let num2 = 11 * 11 // 121

let name = "Mehmet"
let fullName = name + " Tekin" // Mehmet Tekin


// Compound assignment operators

var grade = 100
grade -= 25 // 75

var txt = "This text will get another text via shorthand operators here "
txt += "its added text" // This text will get another text via shorthand operators here its added text


// Comparison operators

let firstNum = 12
let secondNum = 7

print(firstNum == secondNum) // false
print(firstNum != secondNum) // true
print(firstNum < secondNum) // false
print(firstNum > secondNum) // true
print(firstNum <= secondNum) // false
print(firstNum >= secondNum) // true

enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second) // true cause small comes before large


// Conditions

let temperature = 29

if temperature >= 24 {
    print("Season is summer")
} else if (temperature >= 10 && temperature <= 23) {
    print("Season is spring ")
} else {
    print("Season is winter")
}
// Season is summer

let num = -1

if num == 0 {
    print("\(num) is equal to zero.")
} else {
    if num > 0 {
        print("\(num) is positive.")
    } else {
        print("\(num) is negative.")
    }
}
// -1 is negative.

// Combining conditions

let age1 = 18
let age2 = 17

if age1 >= 18 && age2 >= 18 {
    print("You can both get a driver's licens.")
} else if age1 >= 18 || age2 >= 18 {
    print("Only one of you can get a driver's license.")
} else {
    print("Neither of you can get a driver's license.")
}

// Only one of you can get a driver's license.

let firstAge = 23
let secondAge = 21
var agesCompare = firstAge > secondAge ? "First age is bigger than second age" : "Second age is bigger than first age"
print(agesCompare) // First age is bigger than second age

let isAuthenticated = true
print(isAuthenticated ? "Welcome!" : "No Authorization!") // Welcome!

// Switch statements

let weather = "rain"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

enum Emotions {
    case happy
    case sad
    case normal
    case decisive
}

let emotion: Emotions = .decisive

switch emotion {
case .happy:
    print("Keep going this feeling")
case .sad:
    print("Do something to make yourself happy")
case .normal:
    print("Best feeling")
case .decisive:
    print("I have this feeling to learn Swift")
}

// I have this feeling to learn Swift


// Range operators

let grade2 = 71

switch grade2 {
case 85...100:
    print("You passed the lesson. AA")
case 70...84:
    print("You passed the lesson. BB")
case 50...70:
    print("You passed the lesson. CC")
case 0...50:
    print("You failed the lesson. DD")
default:
    print("Invalid grade. FF")
}
// You passed the lesson. BB

