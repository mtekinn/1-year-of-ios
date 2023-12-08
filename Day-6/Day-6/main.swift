//MARK: - Day-6 Closures.1


// Basic Closures

let example = {
    print("Hello, this is basic closures example.") // Hello, this is basic closures example.
}

example()


// Accepting parameters in a closure

let greeting = { (name: String) in
    print("Hello, \(name)")
}

greeting("Mehmet") // Hello, Mehmet


let sendMessage = { (message: String) in
    if message != "" {
        print("Send to X: \(message)")
    } else {
        print("Your message was empty.")
    }
}

sendMessage("Hi") // Send to X: Hi


// Returning values from a closure

let returnArr = { (arr: [Int]) -> [Int] in
    var newArr = [Int]()
    for i in arr {
        if i % 2 == 0 {
            newArr.append(i)
        }
    }
    return newArr
}

var numsArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let res = returnArr(numsArr)
print(res) // [2, 4, 6, 8, 10]


let payment = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}

print(payment()) // true

let bakeBirthdayCake = { (name: String) -> Int in
    print("I've made a cake for \(name); here's the bill.")
    return 50
}


// Closures as parameters

let paramClos = {
    print("This is parameter closures")
}

func funcExample(clos: () -> Void) {
    print("This is inside function.")
    clos()
}

funcExample(clos: paramClos)


let driveSafely = {
    print("I'm being a considerate driver")
}
func drive(using driving: () -> Void) {
    print("Let's get in the car")
    driving()
    print("We're there!")
}
drive(using: driveSafely)


// Trailing closure

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived")
}

travel {
    print("Test")
}


let exampleClousure = {
    print("Example closure")
}

func exampleFunc(clos: () -> Void) {
    print("Inside example func.")
    clos()
}

exampleFunc() {
    print("This is with parameters")
}

exampleFunc {
    print("This is without parameters")
}
