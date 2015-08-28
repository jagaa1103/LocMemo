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


    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        LocationService.sharedInstance.startService()
        LocationService.sharedInstance.locationManager.startUpdatingLocation()
    }
    
    @IBAction func stopLocationClicked(sender: AnyObject) {
        LocationService.sharedInstance.locationManager.stopUpdatingLocation()
    }

    @IBAction func sendClicked(sender: AnyObject) {
        DbService.sharedInstance.saveData(textField.text)
    }

}

