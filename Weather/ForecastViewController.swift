////
////  ForecastViewController.swift
////  Weather
////
////  Created by Jenny Gallagher on 3/24/15.
////  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit


class ForecastViewController: UIViewController, LocationListViewControllerDelegate {
    
    
    let locationController = LocationController()
    
    var selectedLocation : Location? = nil
    
    let forecastView : ForecastView = {
        let colors = UIColor.yellowToPinkColor()
        let view = ForecastView(topColor: colors.topColor, bottomColor: colors.bottomColor)
        return view
        }()
    
    
    
    override func loadView() {
        view = forecastView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        
        self.forecastView.cityListViewButton.addTarget(self, action: "cityListViewButtonTouched:", forControlEvents: .TouchUpInside)
        
        self.locationController.retrieveLocations({location, success in
            if success {
                self.requestWeatherData(location!)
                self.selectedLocation = location!
                
            }
        })
        
    }
    
    func cityListViewButtonTouched(sender: UIButton!) {
        let locationListViewController = LocationListViewController()
        let navigationController = UINavigationController(rootViewController: locationListViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        self.presentViewController(navigationController, animated: true, completion: nil)
        locationListViewController.delegate = self
    }
    
    
    
    func didSelectLocationInLocationListViewController(controller: LocationListViewController, didSelectLocation location: Location) {
        requestWeatherData(location)
        selectedLocation = location
        
    }
    
    
    func requestWeatherData(location : Location){
        self.locationController.requestWeatherDataForLocation(location, completion: { (success, weather) -> Void in
            if success {
                self.forecastView.cityLabel.text = "\(weather.currentCity!),  \(weather.currentState!)"
                self.forecastView.tempLabel.text = "\(weather.temperature!)°"
                self.forecastView.iconImage.image = weather.condition!.icon()
                self.forecastView.summaryLabel.text = weather.summary
                self.forecastView.tempMinMaxLabel.text = "\(weather.temperatureMin!)°/ \(weather.temperatureMax!)°"
            }
        })
    }
    
    // Pull to refresh weather data
    func respondToSwipeGesture(sender : UIGestureRecognizer){
        if sender.state == UIGestureRecognizerState.Ended{
            let location = selectedLocation
            self.requestWeatherData(location!)
        
        }
    }
}


