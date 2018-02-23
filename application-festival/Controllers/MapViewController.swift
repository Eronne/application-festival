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
//		locationManager.desiredAccuracy = kCLLocationAccuracyBest
//		locationManager.requestWhenInUseAuthorization()
//
//		DispatchQueue.main.async {
//			self.locationManager.startUpdatingLocation()
//		}
		
		let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1);
		let mapCenterView:CLLocationCoordinate2D = CLLocationCoordinate2DMake(48.117056, -1.678498)
		let region:MKCoordinateRegion = MKCoordinateRegionMake(mapCenterView, span)
		mapView.setRegion(region, animated: true)
		
		addAnnotation(name: "TNB", latitute: 48.10796740000001, longitude: -1.6725616999999602)
		addAnnotation(name: "Arvor", latitute: 48.1159954, longitude: -1.6791138999999475)
		addAnnotation(name: "ESRA", latitute: 48.1288092, longitude: -1.6420402999999624)
		addAnnotation(name: "Grand Logis", latitute: 48.0231681, longitude: -1.7446339000000535)
		addAnnotation(name: "Esplanade Charles de Gaulles ", latitute: 48.1064896, longitude: -1.6767549999999574)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func addAnnotation(name:String!, latitute:Double!, longitude:Double!) -> Void {
		let annotation = MKPointAnnotation()
		let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitute, longitude)
		annotation.coordinate = location
		annotation.title = name
		return mapView.addAnnotation(annotation)
	}
	
	func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//		let location = locations.last as! CLLocation
//		let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//		var region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//		region.center = mapView.userLocation.coordinate
//		mapView.setRegion(region, animated: true)
	}
	
	func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//		mapView.showAnnotations([userLocation], animated: true)
	}
}
