//
//  ViewController.swift
//  Project16
//
//  Created by Mehmet Tekin on 24.01.2024.
//

import UIKit
import MapKit
import WebKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(changeMapView))
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        let ankara = Capital(title: "Ankara", coordinate: CLLocationCoordinate2D(latitude: 39.925018, longitude: 32.836956), info: "The grave of the father of the Turks, Atatürk")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington, ankara])
    }
    
    @objc func changeMapView() {
        let ac = UIAlertController(title: "Change map style", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Standart", style: .default, handler: changeView))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: changeView))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: changeView))
        ac.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default, handler: changeView))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    func changeView(action: UIAlertAction! = nil) {
        guard let actionTitle = action?.title else { return }
        
        switch actionTitle{
        case "Satellite":
            self.mapView.mapType = .satellite
        case "Hybrid":
            self.mapView.mapType = .hybrid
        case "Hybrid Flyover":
            self.mapView.mapType = .hybridFlyover
        default:
            self.mapView.mapType = .standard
        }
    }
    
    //MARK: - MapView  Methods
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            let pin = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            pin.canShowCallout = true
            pin.markerTintColor = UIColor.green
            annotationView = pin
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)  {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
}

