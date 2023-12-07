//MARK: - Day 4 Loops


let count = 0...5

for i in count {
    print("Count \(i)")
}
// Count 0, Count 1, Count 2, Count 3, Count 4, Count 5

let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
for day in days {
    print("Day: \(day)")
}
// Day: Monday, Day: Tuesday, Day: Wednesday, Day: Thursday, Day: Friday, Day: Saturday, Day: Sunday


// While loops

var num = 1

while num <= 10 {
    print(num)
    num += 1
}

print("Finish while loop!")

let colors = ["Red", "Green", "Blue", "Orange", "Yellow"]
var colorCounter = 0
while colorCounter < 5 {
    print("\(colors[colorCounter]) is a popular color.")
    colorCounter += 1
}

// Repeat loops

var num2 = 1
repeat {
    print(num2)
    num2 += 1
} while num2 <= 10
print("Finish Repeat loops!")
            
repeat {
    print("This is false")
} while false


var scales = ["A", "B", "C", "D", "E"]
var scaleCounter = 0
repeat {
    print("Play the \(scales[scaleCounter]) scale")
    scaleCounter += 1
} while scaleCounter < 3


// Exiting Multiple Loops


var countDown = 10
while countDown >= 0 {
    print(countDown)
    if countDown == 3 {
        print("Let's go!")
        break
    }
    countDown -= 1
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("Okay, that's enough.")
            break outerLoop
        }
    }
}


// Skipping in Loops

for i in 0...10{
  if i % 2 == 0{
    continue
  }
  print(i) // 1 3 5 7 9
}

var carsProduced = 0
repeat {
    carsProduced += 1
    if carsProduced % 2 == 0 {
        continue
    }
    print("Another car was built.")
} while carsProduced < 20

// Infinite Loops

var counter = 0

while true {
    print("Inside infinite loops")
    counter += 1
    if counter == 100 {
        print("Conditions inside the infinite loops")
        break
    }
}


// 
for i in 1...10 {
    continue
}
