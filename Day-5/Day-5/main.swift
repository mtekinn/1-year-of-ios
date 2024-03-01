//MARK: - Day 5 Functions

import Foundation


// Functions Syntax
func funcSyntax() {
    print("This is basic function syntax")
}
funcSyntax() // This is basic function syntax


// Functions with Parameters

func square(number: Int) {
    print(number * number)
}

square(number: 5) // 25


// Functions Returning

func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 7)
print(result) // 49

func arrFunc(arr: [String]) -> String {
    var name = ""
    for i in arr {
        if i == "Mehmet" {
            name = i
        }
    }
    return name
}

let arrList = ["Ece", "Ali", "Burak", "Deniz", "Mehmet"]
print(arrFunc(arr: arrList)) // Mehmet

func evenNums(arr: [Int]) -> [Int] {
    var evenArr = [Int]()
    
    for value in arr {
        if value % 2 == 0 {
            evenArr.append(value)
        }
    }
    return evenArr
}

let arrNums = [1, 2, 3, 55, 21, 42, 80, 36]
print(evenNums(arr: arrNums)) // [2, 42, 80, 36]


// Omitting Parameter Labels

func multiplyTen(_ number: Int) -> Int {
    return number * 10
}

let res = multiplyTen(4)
print(res) // 40

// Default Parameters


func isOkay(_ ok: Bool = true) {
    if ok {
        print("It's okay")
    } else {
        print("It's not okay")
    }
}

isOkay() // It's okay
isOkay(false) // It's not okay


// Variadic Functions

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)

func calculate(numbers: [Int]...) -> Int {
    var result = 0
    for i in numbers {
        print(i)
        for j in i {
            print(j)
            result += j
        }
    }
    return result
}

let result2 = calculate(numbers: [1, 2, 3], [4, 5, 6], [7, 8, 9])
print(result2) // 45


// ***Throwing Functions*** (Important)


enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

// let passResult = try checkPassword("password")
// print(passResult) // Fatal error: Error raised at top level: Day_5.PasswordError.obvious

enum CustomError: Error {
    case invalidInput
    case networkError
}

func divide(_ a: Int, by b: Int) throws -> Int {
    guard b != 0 else {
        throw CustomError.invalidInput
    }
    return a / b
}

do {
    let result = try divide(10, by: 2)
    print("Result: \(result)") // Result: 5
} catch CustomError.invalidInput {
    print("Invalid input provided.")
} catch {
    print("An error occurred: \(error)")
}

let resultWithOptional = try? divide(8, by: 0)
print("Result with optional: \(resultWithOptional)") // Result with optional: nil

let resultForceUnwrapped = try! divide(20, by: 4)
print("Result with force unwrap: \(resultForceUnwrapped)") // Result with force unwrap: 5


// Inout parameters

var testNum = 34
print(testNum) // 34

func testFunc(_ num: inout Int) {
    num = 100
}

testFunc(&testNum)
print(testNum) // 100

enum SwimmingError: Error {
    case cantSwim
}


func paintWalls(tastefully: Bool, color: inout String) {
    if tastefully {
        color = "cream"
    } else {
        color = "tartan"
    }
}
var color = ""
paintWalls(tastefully: true, color: &color)
print(color) // cream
