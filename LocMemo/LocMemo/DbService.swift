//
//  DbService.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

import Firebase

class DbService {
    
    class var sharedInstance: DbService {
        struct Static {
            static var instance: DbService?
        }
        if (Static.instance == nil) {
            Static.instance = DbService()
        }
        return Static.instance!
    }
    
    func saveLocation(lat:Double, lon: Double){
        println("\(lat) \(lon)")
        let geofireRef = Firebase(url: "https://locmemo.firebaseio.com/")
//        let geoFire = GeoFire(firebaseRef: geofireRef)
        var location = ["latitude": lat, "longitude": lon] as NSDictionary
        var dbUrl = Constants.DbUrl
//        let ref = Firebase(url: dbUrl)
//        ref.setValue(location)
//        geoFire.setLocation(CLLocation(latitude: 37.7853889, longitude: -122.4056973), forKey: "firebase-hq") { (error) in
//            if (error != nil) {
//                println("An error occured: \(error)")
//            } else {
//                println("Saved location successfully!")
//            }
//        }
    }
    
    func saveData(txt: String){
        var dbUrl = Constants.DbUrl
        let ref = Firebase(url: dbUrl)
        ref.setValue(txt)
    }
}