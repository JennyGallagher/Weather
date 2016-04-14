//
//  GooglePlaceAPI.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/4/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.

//  Adapted from wiserkuo SearchController - https://github.com/wiserkuo/Swift-SearchController


import UIKit



class GooglePlaceAPI {
    let apiKey = "AIzaSyAvo1QZkVdSprAnJeenXa2xS4O-OKtbB3M"
    var placesTask : NSURLSessionDataTask?
    var session: NSURLSession {
        return NSURLSession.sharedSession()
    }
    var predictions = [Prediction]()
    
    
    func fetchPlacesAutoComplete(input:String, completion: (([Prediction]) -> Void)) -> ()
    {
        predictions.removeAll()
        var urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=\(apiKey)&input=\(input)&types=(cities)"
        
        urlString = urlString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) ?? ""
        
        if let placesTask = placesTask {
            if placesTask.taskIdentifier > 0 && placesTask.state == .Running {
                placesTask.cancel()
            }
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        placesTask = session.dataTaskWithURL(NSURL(string: urlString)!) {data, response, error in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            self.predictions = [Prediction]()
            
            do {
                if let data = data,
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String : AnyObject] {
                        if let results = json["predictions"] as? [[String : AnyObject]] {
                            for rawPlace : AnyObject in results {
                                
                                let place = Prediction(dictionary: rawPlace as! [String : AnyObject])
                                
                                self.predictions.append(place)
                                
                            }
                        }
                }
                dispatch_async(dispatch_get_main_queue()) {
                    completion(self.predictions)
                }
            }
            catch {
                print("Failed to parse predictions")
                dispatch_async(dispatch_get_main_queue()) {
                    completion([])
                }
            }
        }
        placesTask?.resume()
    }
    
    func fetchPlacesDetail(placeid:String, completion: ((Detail?) -> Void)) -> ()
    {
        var place : Detail?
        var urlString = "https://maps.googleapis.com/maps/api/place/details/json?key=\(apiKey)&placeid=\(placeid)"
        urlString = urlString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) ?? ""
        
        if let placesTask = placesTask {
            if placesTask.taskIdentifier > 0 && placesTask.state == .Running {
                placesTask.cancel()
            }
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        placesTask = session.dataTaskWithURL(NSURL(string: urlString)!) { data, response, error in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
            do {
                if let data = data,
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options:[]) as? NSDictionary {
                        if let results = json["result"] as? NSDictionary {
                            place = Detail(dictionary: results)
                            
                        }
                }
                dispatch_async(dispatch_get_main_queue()) {
                    completion(place)
                }
            }
            catch {
                print("Failed to parse data")
                dispatch_async(dispatch_get_main_queue()) {
                    completion(nil)
                }
            }
        }
        placesTask?.resume()
    }
    
    
}