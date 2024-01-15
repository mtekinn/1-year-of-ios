//
//  Person.swift
//  Project12
//
//  Created by Mehmet Tekin on 15.01.2024.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
