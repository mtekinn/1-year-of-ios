//
//  DetailViewController.swift
//  FlagApp
//
//  Created by Mehmet Tekin on 25.12.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var countryImage: String?
    var imageName: String?
    var imageNumber = 0
    var totalImageNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(imageNumber + 1)/\(totalImageNumber)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAboutApp))
        
        if let imageToLoad = countryImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    
    @objc func shareAboutApp() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.9) else { return }
        
        let acv = UIActivityViewController(activityItems: [image, imageName!], applicationActivities: nil)
        acv.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(acv, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
