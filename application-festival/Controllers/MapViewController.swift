//
//  MapViewController.swift
//  application-festival
//
//  Created by Erwann Letue on 18/12/2017.
//  Copyright © 2017 Gobelins. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
	let locationManager = CLLocationManager()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		mapView.delegate = self
		mapView.showsUserLocation = true
		
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestWhenInUseAuthorization()
		
		DispatchQueue.main.async {
			self.locationManager.startUpdatingLocation()
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
		let location = locations.last as! CLLocation
		let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
		var region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
		region.center = mapView.userLocation.coordinate
		mapView.setRegion(region, animated: true)
	}
	
	func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
		mapView.showAnnotations([userLocation], animated: true)
	}
}
