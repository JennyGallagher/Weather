//
//  GooglePlace.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/4/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
  //  Adapted from wiserkuo SearchController - https://github.com/wiserkuo/Swift-SearchController



import CoreLocation



class Prediction {
    let description : String
    let place_id : String
    init(dictionary: [String : AnyObject]){
        
        description = dictionary["description"] as! String
        place_id = dictionary["place_id"] as! String
    }
}


class Detail {
    
    
    var city: String?
    var state: String?
    var postalCode: String?
    var country: String?
    let address : String
    let coordinate: CLLocationCoordinate2D
    init(dictionary : NSDictionary){
        
        // city/state
        address  = dictionary["formatted_address"] as! String
        let addressComponents = dictionary["address_components"] as! [Dictionary<String,AnyObject>]
        for component: Dictionary<String,AnyObject> in addressComponents {
            let types = component["types"] as! [String]
            
            
            if types.contains("locality") {
                self.city = component["long_name"] as? String
                
            } else if types.contains("administrative_area_level_1") {
                self.state = component["short_name"] as? String
                
            } else if types.contains("postal_code") {
                self.postalCode = component["long_name"] as? String
                
            } else if types.contains("country") {
                self.country = component["long_name"] as? String
            }
        }
        
        //coordinates
        let location = dictionary["geometry"]?["location"] as! NSDictionary
        let lat = location["lat"] as! CLLocationDegrees
        let lng = location["lng"] as! CLLocationDegrees
        coordinate = CLLocationCoordinate2DMake(lat, lng)
        
        
    }
}