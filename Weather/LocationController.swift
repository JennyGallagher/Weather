//
//  LocationController.swift
//  Weather
//
//  Created by Jenny Gallagher on 3/24/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//



import Foundation
import CoreLocation



class LocationController : NSObject, CLLocationManagerDelegate {
    
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    var currentLocationLat : Double!
    var currentLocationLong : Double!
    var currentLocationLatString : String!
    var currentLocationLongString : String!
    
    var selectedCity : NSString? = nil
    var selectedState : NSString? = nil
    let locations : [Location] = []
    var selectedLocation : Location? = nil
    
    
    var completionToCallWhenLocationsAreDone : ((Location?, Bool) -> Void)? = nil
    
    
    func retrieveLocations(completion: (Location?, Bool) -> Void) {
        
        locationManager.delegate = self
        locationManager.distanceFilter = 500
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
        
        completionToCallWhenLocationsAreDone = completion
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        print("The authorization status of location services is changed to: ")
        
        switch CLLocationManager.authorizationStatus() {
        case .AuthorizedAlways:
            print("Authorized")
        case .AuthorizedWhenInUse:
            print("Authorized when in use")
            locationManager.startUpdatingLocation()
        case .Denied:
            print("Denied")
        case .NotDetermined:
            print("Not determined")
        case .Restricted:
            print("Restricted")
        }
    }
    
    
    // didFailWithError
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        print(error.localizedDescription)
    }
    
    
    // didUpdateLocations - reverse geocode
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last as CLLocation!
        let currentLocationCoordinates = location.coordinate
        print("didUpdateLocations:  \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        currentLocationLat = currentLocationCoordinates.latitude
        currentLocationLong = currentLocationCoordinates.longitude
        currentLocationLatString = currentLocationCoordinates.latitude.description
        currentLocationLongString = currentLocationCoordinates.longitude.description
        
        
        locationManager.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            if let error = error {
                print("Error:  \(error.localizedDescription)")
                self.completionToCallWhenLocationsAreDone?(nil, false)
                self.completionToCallWhenLocationsAreDone = nil
            }
            else {
                
                if placemarks!.count > 0 {
                    
                    let placemark = placemarks!.last as CLPlacemark!
                    
                    let newLocation = Location(city: placemark!.locality as String!, state: placemark!.administrativeArea as String!, latitude: self.currentLocationLat, longitude: self.currentLocationLong, representsCurrentLocation: true)
                    
                    self.completionToCallWhenLocationsAreDone?(newLocation, true)
                    self.completionToCallWhenLocationsAreDone = nil
                }
            }
        })
    }
    
    
    
    // Network call to Forecast.io
    
    typealias WeatherCompletionClosure = (success : Bool, weather : WeatherData?) -> Void
    
    func requestWeatherDataForLocation(location: Location, useCelsius: Bool, completion: WeatherCompletionClosure) {
        
        let apiKey = "81e71bbb6b05cc0f6f5fca5ac0ecdac2"
        
//        let useCelsius : Bool = true
        
        let urlComponents: NSURLComponents = {
            let components = NSURLComponents()
            components.scheme = "https"
            components.host = "api.forecast.io"
            components.path = "/forecast/\(apiKey)/\(location.latitude),\(location.longitude)"
            if useCelsius {
                components.queryItems = [NSURLQueryItem(name: "units", value: "si")]
            }
            return components
            }()
        
       
        let URL = urlComponents.URL
        
        let sharedSession = NSURLSession.sharedSession()
        
        let downloadTask = sharedSession.downloadTaskWithURL(URL!, completionHandler: { (url: NSURL? , response: NSURLResponse?, error:NSError?) -> Void in
            
            if (error == nil) {
                
                do {
                
                    let dataObject = NSData(contentsOfURL: url!)
                    guard let weatherDictionary: NSDictionary = try NSJSONSerialization.JSONObjectWithData(dataObject!, options: []) as? NSDictionary else {
                        dispatch_async(dispatch_get_main_queue(), {() -> Void in
                            completion(success: false, weather: nil)
                        })
                        
                        return
                    }
                    
                    var currentWeather = WeatherData(weatherDictionary: weatherDictionary)
                    currentWeather.currentCity = location.city
                    currentWeather.currentState = location.state
                    
                    dispatch_async(dispatch_get_main_queue(), {() -> Void in
                        completion(success: true, weather: currentWeather)
                    })
                    
                }
                catch {
                    
                    print("There was an unknown error")
                
                }
                
            }
        })
        
        downloadTask.resume()
    }
    
}











// Retrieving weather in the future: https://api.forecast.io/forecast/APIKEY/LATITUDE,LONGITUDE,TIME


///Google API : AIzaSyDd-w4c07w0ILUr_l0inPcHXqIZiP-XzpM


