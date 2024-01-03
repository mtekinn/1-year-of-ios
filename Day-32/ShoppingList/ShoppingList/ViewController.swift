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
        title = "Shopping List"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(clearList))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addItem))
    }
    
    @objc func addItem(item: String) {
        let ac = UIAlertController(title: "What do you want to add your shop list?", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let item = ac.textFields?[0].text else { return }
            self.add(item)
            self.tableView.reloadData()
        }
        ac.addAction(addAction)
        present(ac, animated: true)
    }
    
    func add(_ item: String) {
        if !item.isEmpty {
            shoppingList.insert(item, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @objc func clearList() {
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
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
