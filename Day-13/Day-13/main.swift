
//MARK: - Day 13 Summary-1

import SwiftUI

// Topics
/*
Variables and Constants
Types of Data
Operators
String Interpolation
Arrays
Dictionaries
Conditional Statements
Loops
Switch Case
*/


// 1. Variables and Constants

var name = "Mehmet" // variable
let surname = "Tekin" // constant

var age = 24
age = 25 // we can change the value if we are declared var keyword

var number = 128
number = 0

// let year = 1923
// year = 2023 // this line returns error - Cannot assign to value: 'year' is a 'let' constant


// 2. Types of Data

var firstName: String
firstName = "Mehmet"

var num: Int
num = 24

var doubleNumber: Double
doubleNumber = 3.14159265359
print(doubleNumber) // 3.14159265359

var floatNumber: Float
floatNumber = 3.14159265359
print(floatNumber) // 3.1415927

// Note: Apple recommends that we use Double. Because it has more accurate results in larger numbers.

var boolValue: Bool
boolValue = false


// 3. Operators

var number2 = 10
number2 = number2 + 1 // 11
number2 = number2 - 2 // 9
number2 = number2 * 3 // 27
number2 = number2 / 9 // 3

var number3 = 30
number3 += 1 // 31
number3 -= 3 // 28
number3 *= 2 // 56
number3 /= 7 // 8

var n1: Double = 12.4
var n2: Double = 6.1
var n3 = n1 + n2 // 18.5


var firstNamee = "Mehmet"
var lastName = " Tekin"
var fullName = firstNamee + lastName // Mehmet Tekin

print(firstName == "Mehmet") // true
print(lastName == "TEKIN") // false


var compNum = 12
var compNum2 = 6

print(compNum > compNum2) // true
print(compNum < compNum2) // false
print(compNum >= compNum2) // true
print(compNum <= compNum2) // false


var res = true
print(!res) // false


// 4. String Interpolation


var mehmet = "Mehmet Tekin"
print("My name is \(mehmet)")


var num1 = 23
var num2 = 11
print("Sum of two number: \(num1 + num2)")


// 5. Arrays

var numbers = [1, 11, 6, 4, 21]
var names = ["Mehmet", "Burak", "Deniz", "Firuze"]
print(names[0]) // Mehmet
print(names[3]) // Firuze

print(type(of: numbers)) // Array<Int>


var songs: [String] = []
songs.append("Nothing Else Matters")
print(songs) // ["Nothing Else Matters"]

var intArray: [Int] = [1, 2, 3, 4, 5]
var strArray: [String] = ["one", "two", "three", "four", "five"]
var anyArray: [Any] = ["one", 2, "three", 4, "five"]


// 6. Dictionaries

var person = [
    "name": "Mehmet",
    "surname": "Tekin",
    "title": "iOS Developer"
]

print(person["name"]!) // Mehmet


var person2: [String: Any] = [
    "name": "Mehmet",
    "surname": "Tekin",
    "age": 24,
    "languages": ["Turkish", "English", "German"],
    "married": false
]
print(person2["age"]!) // 24


// 7. Conditional statements

var learnSwift = true

if learnSwift {
    print("Keep going coding!")
}


var awake = true
var energetic = true

if awake && energetic {
    print("Go coding for improve skills!")
}


var age1 = 17
var age2 = 14

if age1 < 18 && age2 < 18 {
    print("You both guys can't get a driver's license.")
}


// 8. Loops

for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}
 
for _ in 1...5 {
    print("hii")
}


var songs2 = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for i in songs2 {
    print(i)
}

let songs3 = ["wish i loved you in the 90s", "bad ones" , "you broke me first"]
for song in songs3 {
    if song != "wish i loved you in the 90s" {
      continue
    }
    print("My favorite song is \(song)")
}

// Inner loops
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
    var str = "\(people[i]) gonna"
    for _ in 1...5 {
        str += " \(actions[i])"
    }
    print(str)
}


for i in 1...5 {
    for _ in 1...i {
        print("*", terminator: "")
    }
    print(" ")
}


// While loops
var counter = 0

while true {
    print("Counter in now \(counter)")
    counter += 1
    
    if counter == 555 {
        break
    }
}

var grade = 0

while true {
    if grade <= 60 {
        print("Fail. Your grade is \(grade)")
    } else {
        print("Success. Your grade is \(grade)")
    }
    if grade == 100 {
        break
    }
    grade += 1
}


// 9. Switch case

let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")
case 1:
    print("You just released iTunes Live From SoHo")
case 2:
    print("You just released Speak Now World Tour")
default:
    print("Have you done someting new?")
}

var grade2 = 81

switch grade2 {
case 0...25:
    print("You failed the exam. FF")
case 26...44:
    print("You failed the exam. DD")
case 45...60:
    print("You passed the exam. CC")
case 61...80:
    print("You passed the exam. BB")
case 81...100:
    print("You passed the exam. AA")
default:
    print("Invalid grade")
}


let capitals = ["England": "London", "Wales": "Cardiff"]
let scotlandCapital = capitals["Scotland"]

print(scotlandCapital)
