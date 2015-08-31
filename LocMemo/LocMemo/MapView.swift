//
//  MapView.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/31/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self,selector: Selector("changeMapLocation:"),
            name: "locationChanged", object:nil)
    }
    
    @IBOutlet weak var mapField: MKMapView!
                var annotation = MKPointAnnotation()
    
    
    func changeMapLocation(data:NSNotification){
        var locationData = data.object as! NSDictionary
        var latStr = locationData.objectForKey("lat") as! NSString
        var lonStr = locationData.objectForKey("lon") as! NSString
        var lat = latStr.doubleValue
        var lon = lonStr.doubleValue
        
        println("changedMapLocation 2>> lat:\(lat), lon:\(lon)")
        
        var location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: lon
        )
        
        var span = MKCoordinateSpanMake(0.02 , 0.02)
        var region = MKCoordinateRegion(center: location, span: span)
        if(mapField != nil){
            mapField.setRegion(region, animated: true)
            annotation.coordinate = location
            annotation.title = "Roatan"
            annotation.subtitle = "Honduras"
            
            mapField.addAnnotation(annotation)
        }
    }
    
}