////
////  ForecastViewController.swift
////  Weather
////
////  Created by Jenny Gallagher on 3/24/15.
////  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit


class ForecastViewController: UIViewController {
    
    
    let locationController = LocationController()
    
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
        
        self.forecastView.cityListViewButton.addTarget(self, action: "cityListViewButtonTouched:", forControlEvents: .TouchUpInside)
        
        self.locationController.retrieveLocations({ success in
            if success {
                self.locationController.requestWeatherDataForCity({ (success, weather) -> Void in
                    if success {
                        
                        self.forecastView.cityLabel.text = "\(weather.currentCity!),  \(weather.currentState!)"
                        self.forecastView.tempLabel.text = "\(weather.temperature!)°"
                        //                        self.forecastView.currentTimeLabel.text = weather.currentTime
                        self.forecastView.iconImage.image = weather.condition!.icon()
                        self.forecastView.summaryLabel.text = weather.summary
                        self.forecastView.tempMinMaxLabel.text = "\(weather.temperatureMin!)°/ \(weather.temperatureMax!)°"
                    }
                })
            }
        })
    }
    func cityListViewButtonTouched(sender: UIButton!) {
        let controller = LocationListViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: false)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    func respondToButtonClick(sender:UIButton!){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}











// Getting address from string:
//
//                locationController.getAddressFromSearch(addressString: "springfield", completion: { locations in
//                println(locations)
//                })
