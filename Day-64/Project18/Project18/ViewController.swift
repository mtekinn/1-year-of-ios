//
//  ViewController.swift
//  Project18
//
//  Created by Mehmet Tekin on 28.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("I'm inside the viewDidLoad() method!")
//        print(1, 2, 3, 4, 5, separator: "*")
//        print("Some message", terminator: " ... ")
                
//        assert(myReallySlowMethod() == true, "The slow method returned false, which is a bad thing!")
        
        for i in 1...100 {
            print("Got number \(i)")
        }
    }
    
    func myReallySlowMethod() -> Bool {
        print("This is inside the myReallySlowMethod methhod")
        return true
    }


}

