//
//  LocationModel.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/2/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import Foundation

struct Location : Printable, DebugPrintable {
    var city : String = ""
    var state : String = ""
    var latitude : Double = 0
    var longitude : Double = 0
    var representsCurrentLocation : Bool = false
    
    var description : String {
        get {
            return "\(city), \(state), \(latitude), \(longitude)"
        }
    }
    
    var debugDescription : String {
        
        get {
            return description
        }
    }
    
    
    
    // Added to use in NSUserDefaults -  delete if not used
    func toDictionary() -> [String:AnyObject] {
        var dictionary:[String:AnyObject] = [String:AnyObject]()
        
        dictionary["city"] = city ?? ""
        dictionary["state"] = state ?? ""
        
        return dictionary
    }
}
