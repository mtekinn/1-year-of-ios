//
//  Person.swift
//  Project12
//
//  Created by Mehmet Tekin on 15.01.2024.
//

import UIKit

class Person: NSObject, NSCoding, NSSecureCoding {
    var name: String
    var image: String

    static var supportsSecureCoding = true
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        image = coder.decodeObject(forKey: "image") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(image, forKey: "image")
    }
}
