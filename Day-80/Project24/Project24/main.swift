//
//  main.swift
//  Project24
//
//  Created by Mehmet Tekin on 13.02.2024.
//

import Foundation
import SwiftUI


let password = "12345"
// print(password.hasPrefix("123"))
// print(password.hasSuffix("345"))

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}

let weather = "it's going to rain"
print(weather.capitalized)


extension String {
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }
}


print(weather.capitalizedFirst)


let input = "Swift is like Objective-C without the C"
print(input.contains("2"))

let languages = ["Python", "Ruby", "Swift"]
print(languages.contains("Swift"))


extension String {
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        return false
    }
}

print(input.containsAny(of: languages))
print(languages.contains(where: input.contains))


extension String {
    func withPrefix(_ str: String) -> String {
        if self.contains(str) {
            return self
        } else {
            return str + self
        }
    }
}


let a = "pet"

print(a.withPrefix("car"))

extension String {
    func isNumeric() -> Bool {
        for i in self {
            if i.isNumber {
                return true
            }
        }
        return false
    }
}

var myStr = "abc1def"
print(myStr.isNumeric())

extension String {
    func lines() -> Array<String> {
        var arr = [String]()
        for i in self.split(separator: "\n") {
            arr.append(String(i))
        }
        return arr
    }
}


var myString = "this\nis\na\ntest"
print(myString.lines())
