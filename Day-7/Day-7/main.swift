//MARK: - Day 7 Closures-2


// Using closures as parameters when they accept parameters

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}


func buildCar(name: String, engine: (Int) -> Void) {
    print("Building \(name)")
    engine(100)
}

let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

buildCar(name: "Volvo", engine: changeSpeed)
// Building Volvo, // Changing speed to 100kph

func exampleFunc(str: (String) -> Void) {
    print("Hey")
    str("This is example param")
    print("It's okay")
}

exampleFunc { (test: String) in
    print("This is how closures take parameter exaple. \(test)")
}
// This is how closures take parameter exaple. This is example param



// Using closures as parameters when they return values

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description) // I'm going to London in my car.
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car."
}


func learn(test: (String, Double) -> String) {
    print("Start")
    let testDemo = test("Inside learn func", 6.4) // This is inside learn func text: Inside learn func, 6.4
    print(testDemo)
    print("Finish")
}

learn { (myStr: String, myDouble: Double) in
    return "This is inside learn func text: \(myStr), \(myDouble)"
}



// Shorthand parameter names

func traveling(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

//traveling { (place: String) -> String in
//    return "I'm going to \(place) in my car"
//}


//traveling { place -> String in
//    return "I'm going to \(place) in my car"
//}


//traveling { place in
//    return "I'm going to \(place) in my car"
//}


//traveling { place in
//    "I'm going to \(place) in my car"
//}


//travel { place in
//    "I'm going to \(place) in my car"
//}


travel {
    "I'm going to \($0) in my car"
}



// Closures with multiple parameters


func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}

// I'm going to London at 60 miles per hour.

travel { (test, demo) in
    "I'm going to \(test), at \(demo) miles per hour."
}

// This will give the same output



// Returning closures from functions

func travel2() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel2()
result("Istanbul") // I'm going to Istanbul


func randomNums() -> () -> Int {
    let function = { Int.random(in: 1...10) }
    return function
}

let generator = randomNums()
let random1 = generator()
print(random1)


// Capturing values

var counter = 0

func counterFunc() -> (String) -> Void {
    var count = 0
    counter += 1
    print("Function called \(counter) times")
    return { myStr in
        count += 1
        print("Closure paramter: \(myStr) and count: \(count)")
    }
}


let result2 = counterFunc()
result2("One")
result2("Two")
result2("Three")
let result3 = counterFunc()

/*
 Function called 1 times
 Closure paramter: One and count: 1
 Closure paramter: Two and count: 2
 Closure paramter: Three and count: 3
 Function called 2 times
*/

func makeRepeater(count: Int) -> (Int) -> Void {
    return {
        for _ in 0..<count {
            print($0)
        }
    }
}
let repeater = makeRepeater(count: 3)
repeater(4)
// 4, 4, 4

