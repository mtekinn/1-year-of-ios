//
//  ViewController.swift
//  Project22
//
//  Created by Mehmet Tekin on 8.02.2024.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var distanceReading: UILabel!
    
    var locationManager: CLLocationManager?
    var triggerAlert = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        
        view.backgroundColor = .gray

    }
    
    
    //MARK: - CoreLocation methods
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            if self.triggerAlert {
                self.triggerAlert = true
                let ac = UIAlertController(title: "OK", message: "You find first beacon", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: nil, style: .cancel))
                present(ac, animated: true)
            }
            update(distance: beacon.proximity, beaconID: Int(truncating: beacon.major))
        } else {
            update(distance: .unknown, beaconID: 0)
        }
    }
    
    //MARK: - Others methods

    
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let uuid2 = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7EA")!
        let uuid3 = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E7")!

        let beaconRegion = CLBeaconRegion(uuid: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: CLBeaconIdentityConstraint.init(uuid: uuid, major: 123, minor: 456))

        let secondBeaconRegion = CLBeaconRegion(uuid: uuid2, major: 153, minor: 456, identifier: "MyBeacon2")
        locationManager?.startMonitoring(for: secondBeaconRegion)
        locationManager?.startRangingBeacons(satisfying: CLBeaconIdentityConstraint.init(uuid: uuid, major: 153, minor: 456))

        let thirtBeaconRegion = CLBeaconRegion(uuid: uuid3, major: 163, minor: 456, identifier: "MyBeacon3")
        locationManager?.startMonitoring(for: thirtBeaconRegion)
        locationManager?.startRangingBeacons(satisfying: CLBeaconIdentityConstraint.init(uuid: uuid, major: 163, minor: 456))
    }
    
    func update(distance: CLProximity, beaconID: Int) {
        UIView.animate(withDuration: 0.8) {
            switch distance {
            case .far:
                self.view.backgroundColor = UIColor.blue
                self.distanceReading.text = "FAR"

            case .near:
                self.view.backgroundColor = UIColor.orange
                self.distanceReading.text = "NEAR"

            case .immediate:
                self.view.backgroundColor = UIColor.red
                self.distanceReading.text = "RIGHT HERE"

            default:
                self.view.backgroundColor = UIColor.gray
                self.distanceReading.text = "UNKNOWN"
            }
        }
    }



}

