//
//  ViewController.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit
import CoreLocation

class MainView: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        startLocation = nil
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutClicked(sender: AnyObject) {
        LoginService.sharedInstance.logoutUser(){
            res in
            if(res == true){
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    @IBAction func startLocationClicked(sender: AnyObject) {
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func stopLocationClicked(sender: AnyObject) {
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sendClicked(sender: AnyObject) {
        DbService.sharedInstance.saveData(textField.text)
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var latestLocation: AnyObject = locations[locations.count - 1]
        var lat = latestLocation.coordinate.latitude as Double
        var lon = latestLocation.coordinate.longitude as Double
        DbService.sharedInstance.saveLocation(lat, lon: lon)
    }
}

