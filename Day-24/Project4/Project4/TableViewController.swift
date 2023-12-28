//
//  TableViewController.swift
//  Project4
//
//  Created by Mehmet Tekin on 27.12.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var websites = ["apple.com", "hackingwithswift.com", "github.com", "x.com", "reddit.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? ViewController {
            let index = indexPath.row
            vc.webIndex = index
            vc.websites = websites
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
