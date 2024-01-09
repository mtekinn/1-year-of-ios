//
//  ViewController.swift
//  Project9
//
//  Created by Mehmet Tekin on 8.01.2024.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Whitehouse People API"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showAlert))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterPetitions))
        
        performSelector(inBackground: #selector(fetchJSON), with: nil)

    }
    
    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Search", message: "Enter a search string", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Filter", style: .default, handler: { [unowned ac, weak self] _ in
            guard let searchTerm = ac.textFields?[0].text else { return }
            self?.title = "\"\(searchTerm)\""
            
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                
                self?.filteredPetitions = self?.petitions.filter { $0.title.uppercased().contains(searchTerm.uppercased()) || $0.body.uppercased().contains(searchTerm.uppercased())
                } ?? []
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }))
        
        present(ac, animated: true)
    }
    
    @objc func fetchJSON() {
        let urlString: String

        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }

        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }

    
    @objc func showAlert() {
        let ac = UIAlertController(title: nil, message: "Data comes from the We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filteredPetitions[indexPath.row].title
        cell.detailTextLabel?.text = filteredPetitions[indexPath.row].body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}



