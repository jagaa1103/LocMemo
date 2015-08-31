//
//  DbService.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import CoreLocation
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
    
    func saveLocation(lat: Double, lon: Double){
        var dbUrl = Constants.DbUrl
        let ref = Firebase(url: dbUrl)
        var location = ["lat":lat, "lon": lon]
        ref.setValue(location)
    }
    
    func saveData(txt: String){
        var dbUrl = Constants.DbUrl
        let ref = Firebase(url: dbUrl)
        ref.setValue(txt)
    }
}