//
//  Person.swift
//  Project12b
//
//  Created by Mehmet Tekin on 17.01.2024.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
