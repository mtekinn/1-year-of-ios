//
//  ViewController.swift
//  ShoppingList
//
//  Created by Mehmet Tekin on 3.01.2024.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .remove, style: .done, target: self, action: #selector(clearList))
        
        title = "Shopping List"
    }
    
    @objc func addItem(item: String) {
        shoppingList.append(item)
    }
    
    @objc func clearList() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Text", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
}
