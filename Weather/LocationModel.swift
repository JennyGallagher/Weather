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
    
    var description : String {
        get {
            return "\(city), \(state), \(latitude), \(longitude)"
        }
    }
    
    var debugDescription : String {
        
        get {
            return self.description
        }
    }
    
    
    
    
    func toDictionary() -> [String:AnyObject] {
        var dictionary:[String:AnyObject] = [String:AnyObject]()
        
        dictionary["city"] = self.city ?? ""
        dictionary["state"] = self.state ?? ""
        
        return dictionary
    }
}
