//
//  LocationModel.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/2/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import Foundation

let LocationSavedCity = "city"
let LocationSavedState = "state"
let LocationSavedLatitude = "latitude"
let LocationSavedLongitude = "longitude"

let LocationSavedUserList = "locationSavedUserList"
let LocationSavedUserDefault = "locationSavedUserDefault"

struct Location : CustomStringConvertible, CustomDebugStringConvertible {
    var city : String = ""
    var state : String = ""
    var latitude : Double = 0
    var longitude : Double = 0
    var representsCurrentLocation : Bool = false
    
    init(city: String, state: String, latitude: Double, longitude: Double, representsCurrentLocation: Bool) {
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
        self.representsCurrentLocation = representsCurrentLocation
    }
    
    init(dictionary: [String : AnyObject]) {
        self.city = dictionary[LocationSavedCity] as? String ?? ""
        self.state = dictionary[LocationSavedState] as? String ?? ""
        self.latitude = dictionary[LocationSavedLatitude] as? Double ?? 0.0
        self.longitude = dictionary[LocationSavedLongitude] as? Double ?? 0.0
    }
    
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
    
    /// MARK: Location NSuserDefaults
    func toDictionary() -> [String : AnyObject] {
        var dictionary = [String : AnyObject]()
        
        dictionary[LocationSavedCity] = city ?? ""
        dictionary[LocationSavedState] = state ?? ""
        dictionary[LocationSavedLatitude] = latitude ?? 0.0
        dictionary[LocationSavedLongitude] = longitude ?? 0.0
        
        return dictionary
    }
    
    static func saveLocationsToUserDefaults(locations : [Location]) {
        let locationsAsDictionary = locations.map { $0.toDictionary() }
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(locationsAsDictionary, forKey: LocationSavedUserList)
        userDefaults.synchronize()
    }
    
    static func restoreSavedLocationsFromUserDefaults() -> [Location] {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let locationsAsDictionaries = userDefaults.objectForKey(LocationSavedUserList) as? [[String : AnyObject]] ?? []
        return locationsAsDictionaries.map { Location(dictionary: $0) }
    }
    
    static func saveDefaultLocationToUserDefaults(location : Location) {
        let locationAsDictionary = location.toDictionary()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(locationAsDictionary, forKey: LocationSavedUserDefault)
        userDefaults.synchronize()
    }
    
    static func restoreSavedDefaultLocationFromUserDefaults() -> Location? {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let locationAsDictionary = userDefaults.objectForKey(LocationSavedUserDefault) as? [String : AnyObject] {
            return Location(dictionary: locationAsDictionary)
        }
        return nil
    }
}
