//
//  LocationService.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService{
    
    class var sharedInstance: LocationService {
        struct Static {
            static var instance: LocationService?
        }
        if (Static.instance == nil) {
            Static.instance = LocationService()
        }
        return Static.instance!
    }
    
}