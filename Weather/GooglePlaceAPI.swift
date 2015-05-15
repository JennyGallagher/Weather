//
//  GooglePlaceAPI.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/4/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//


import UIKit



class GooglePlaceAPI {
    let apiKey = "AIzaSyAvo1QZkVdSprAnJeenXa2xS4O-OKtbB3M"
    var placesTask = NSURLSessionDataTask()
    var session: NSURLSession {
        return NSURLSession.sharedSession()
    }
    var predictions = [Prediction]()
    
    
    func fetchPlacesAutoComplete(input:String, completion: (([Prediction]) -> Void)) -> ()
    {
        predictions.removeAll()
        var urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=\(apiKey)&input=\(input)&types=(regions)"
        
        urlString = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        if placesTask.taskIdentifier > 0 && placesTask.state == .Running {
            placesTask.cancel()
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        placesTask = session.dataTaskWithURL(NSURL(string: urlString)!) {data, response, error in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            self.predictions = [Prediction]()
            if let json = NSJSONSerialization.JSONObjectWithData(data, options:nil, error:nil) as? [String : AnyObject] {
                if let results = json["predictions"] as? [[String : AnyObject]] {
                    for rawPlace : AnyObject in results {
                        let place = Prediction(dictionary: rawPlace as! [String : AnyObject])
                        self.predictions.append(place)
                        //                        println("\(place.description) , \(place.place_id)")
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue()) {
                completion(self.predictions)
            }
        }
        placesTask.resume()
    }
    
    func fetchPlacesDetail(placeid:String, completion: ((Detail?) -> Void)) -> ()
    {
        var place : Detail!
        var urlString = "https://maps.googleapis.com/maps/api/place/details/json?key=\(apiKey)&placeid=\(placeid)"
        urlString = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        if placesTask.taskIdentifier > 0 && placesTask.state == .Running {
            placesTask.cancel()
        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        placesTask = session.dataTaskWithURL(NSURL(string: urlString)!) {data, response, error in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if let json = NSJSONSerialization.JSONObjectWithData(data, options:nil, error:nil) as? NSDictionary {
                if let results = json["result"] as? NSDictionary {
                    place = Detail(dictionary: results)
                    //                    println("\(place.address) , \(place.coordinate.latitude) , \(place.coordinate.longitude)")
                }
            }
            dispatch_async(dispatch_get_main_queue()) {
                completion(place)
            }
        }
        placesTask.resume()
    }
    
    
}