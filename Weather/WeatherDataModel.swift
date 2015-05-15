//
//  WeatherModel.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/2/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//


import UIKit



// Conditions and their matching icons
enum WeatherCondition : String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
    case Unknown = "default"
    
    func icon() -> UIImage {
        return UIImage(named: self.rawValue) ?? UIImage(named: "default")!
    }
}

class WeatherData {
    
    var currentCity : String?
    var currentState : String?
    var currentTime : String?
    var temperature : Int?
    var temperatureMax : Int?
    var temperatureMin : Int?
    var humidity : Double?
    var precipProbability : Double?
    var summary : String?
    var condition : WeatherCondition?
    
    
    var hourly : [NSMutableDictionary]?
    var daily : [NSMutableDictionary]?
    
    init(weatherDictionary: NSDictionary) {
        let currentWeather = weatherDictionary["currently"] as! NSDictionary
        let dailyWeather = weatherDictionary["daily"] as! NSDictionary
        let dailyWeatherArray = dailyWeather["data"] as! NSArray
        let dailyWeatherDictionary: NSDictionary = dailyWeatherArray[0] as! NSDictionary
        
        temperature = currentWeather["temperature"] as? Int
        temperatureMax = dailyWeatherDictionary["temperatureMax"] as? Int
        temperatureMin = dailyWeatherDictionary["temperatureMin"] as? Int
        humidity = currentWeather["humidity"] as? Double
        precipProbability = currentWeather["precipProbability"] as? Double
        summary = currentWeather["summary"] as? String
        
        let iconString = currentWeather["icon"] as! String
        condition = WeatherCondition(rawValue: iconString) ?? WeatherCondition.Unknown
        
        
        let currentTimeInValue = currentWeather["time"] as! Int
        currentTime = dateStringFromUnixTime(currentTimeInValue)
    }
    
    func dateStringFromUnixTime(UnixTime: Int) -> String {
        
        let timeInSeconds = NSTimeInterval(UnixTime)
        let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds)
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        
        return dateFormatter.stringFromDate(weatherDate)
    }
}

