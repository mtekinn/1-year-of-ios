//
//  ViewController.swift
//  FlagApp
//
//  Created by Mehmet Tekin on 25.12.2023.
//


import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Share Flag Application"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loadImages()
    }
    
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items.sorted() {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = pictures[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.countryImage = pictures[indexPath.row]
            vc.imageName = pictures[indexPath.row]
            vc.imageNumber = indexPath.row
            vc.totalImageNumber = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

