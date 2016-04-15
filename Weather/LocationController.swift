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
        switch CLLocationManager.authorizationStatus() {
        case .AuthorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        fatalError(error.localizedDescription) // TODO: Better error handling
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last as CLLocation!
        let currentLocationCoordinates = location.coordinate
        
        locationManager.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            if let _ = error {
                self.completionToCallWhenLocationsAreDone?(nil, false)
                self.completionToCallWhenLocationsAreDone = nil
            }
            else {
                if placemarks!.count > 0 {
                    let placemark = placemarks!.last as CLPlacemark!
                    
                    let newLocation = Location(city: placemark!.locality as String!, state: placemark!.administrativeArea as String!, latitude: currentLocationCoordinates.latitude, longitude: currentLocationCoordinates.longitude, representsCurrentLocation: true)
                    
                    self.completionToCallWhenLocationsAreDone?(newLocation, true)
                    self.completionToCallWhenLocationsAreDone = nil
                }
            }
        })
    }
    
    
    
    // Network call to Forecast.io
 
    
    typealias WeatherCompletionClosure = (success : Bool, weather : WeatherData?) -> Void
    
    func requestWeatherDataForLocation(location: Location, useCelsius: Bool, completion: WeatherCompletionClosure) {
        
        let apiKey = "add unique API key here"
        
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
        
        let dataTask = sharedSession.dataTaskWithURL(URL!, completionHandler: { (data: NSData? , response: NSURLResponse?, error: NSError?) -> Void in
            
            if error == nil {
                do {
                    guard let weatherDictionary: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary else {
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
                catch let error as NSError {
                    fatalError(error.localizedDescription)
                }
            }
        })
        
        dataTask.resume()
    }
}




