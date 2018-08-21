//
//  ViewController.swift
//  location_spoof
//
//  Created by Peter Tao on 7/30/18.
//  Copyright © 2018 Peter Tao. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    var map = MKMapView()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        print(CLLocationManager.authorizationStatus())
        print(CLAuthorizationStatus.authorizedAlways == CLLocationManager.authorizationStatus())
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startUpdatingLocation()
        
        map.frame = self.view.frame
        self.view.addSubview(map)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            print(center)
            map.setRegion(MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)
            map.showsUserLocation = true
        }
        
//        if UIApplication.shared.applicationState != .active {
//            print("App is backgrounded.")
//        }
    }
    
    
    



}

