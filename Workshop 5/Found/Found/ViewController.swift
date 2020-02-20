//
//  ViewController.swift
//  Found
//
//  Created by Martin Mikusovic on 20/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.setUserTrackingMode(.follow, animated: true)
    }

    @IBAction func addPin(_ sender: Any) {
        let pin = MKPointAnnotation()
        pin.coordinate = mapView.userLocation.coordinate
        mapView.addAnnotation(pin)
    }
}
