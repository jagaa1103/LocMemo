//
//  LocationService.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class LocationService: NSObject, CLLocationManagerDelegate{

    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    class var sharedInstance: LocationService {
        struct Static {
            static var instance: LocationService?
        }
        if (Static.instance == nil) {
            Static.instance = LocationService()
        }
        return Static.instance!
    }
    
    func startService() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        startLocation = nil
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var latestLocation: AnyObject = locations[locations.count - 1]
        var lat = latestLocation.coordinate.latitude as Double
        var lon = latestLocation.coordinate.longitude as Double
        DbService.sharedInstance.saveLocation(lat, lon: lon)
    }

    
}