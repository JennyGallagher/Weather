//
//  LocationListViewController.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/6/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit
import CoreLocation



protocol LocationListViewControllerDelegate : class {
    func didSelectLocationInLocationListViewController(controller: LocationListViewController, didSelectLocation location: Location, useCelsius : Bool)
}

typealias LocationAndWeatherPair = (location: Location, weatherData: WeatherData?)

class LocationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocationSearchViewControllerDelegate, LocationListViewDelegate {
    
    weak var delegate : LocationListViewControllerDelegate? = nil
    var useCelsius : Bool = false
    var useCelsiusButtonSelected: Bool?
    
    let locationController = LocationController()
    var locationAndWeatherPairs : [LocationAndWeatherPair] = []
    
    let footerView = FooterView()
    
    let locationListView : LocationListView = {
        let colors = UIColor.yellowToPinkColor()
        let view = LocationListView(topColor: colors.topColor, bottomColor: colors.bottomColor)
        return view
    }()
    
    
    override func loadView() {
        view = locationListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewForInitialDataLoad()
        retrieveCurrentLocation()
        
        if let defaultUseCelsius =
            UseCelsius.restoreSavedDefaultUnitFromUserDefaults() {
                useCelsius = defaultUseCelsius.useCelsius
                if useCelsius {
                    
                }
        }
    }
    
    private func retrieveCurrentLocation() {
        locationController.retrieveLocations({location, success in
            if success {
                if let location = location {
                    self.locationAndWeatherPairs.insert((location, nil), atIndex: 0)
                    
                    let locations = Location.restoreSavedLocationsFromUserDefaults()
                    
                    let locationsWithNilWeather = locations.map { LocationAndWeatherPair( $0, nil) }
                    self.locationAndWeatherPairs.appendContentsOf(locationsWithNilWeather)
                    
                    self.locationListView.tableView.reloadData()
                    self.populateWeatherDataForLocations()
                }
            }
        })
    }
    
    private func clearAllWeatherData() {
        for i in 0..<locationAndWeatherPairs.count {
            var locationAndWeatherPair = locationAndWeatherPairs[i]
            locationAndWeatherPair.weatherData = nil
            self.locationAndWeatherPairs[i] = locationAndWeatherPair
        }
        locationListView.tableView.reloadData()
    }
    
    
    private func populateWeatherDataForLocations() {
        for i in 0..<locationAndWeatherPairs.count {
            var locationAndWeatherPair = locationAndWeatherPairs[i]
            locationController.requestWeatherDataForLocation(
                locationAndWeatherPair.location,
                useCelsius: useCelsius,
                completion: { success, weather in
                    locationAndWeatherPair.weatherData = weather
                    self.locationAndWeatherPairs[i] = locationAndWeatherPair
                    self.locationListView.refreshControl.endRefreshing()
                    self.locationListView.tableView.reloadData()
            })
        }
    }
    
    private func prepareViewForInitialDataLoad() {
        locationListView.delegate = self
        locationListView.tableView.dataSource = self
        locationListView.tableView.delegate = self
    }
    
    
    func locationSearchViewController(controller: LocationSearchViewController, didAddNewLocation location: Location) {
        let locationWeatherPair : LocationAndWeatherPair = (location, nil)
        locationAndWeatherPairs.append(locationWeatherPair)
        
        let locations = locationAndWeatherPairs.map { $0.0 }.filter { !$0.representsCurrentLocation }
        Location.saveLocationsToUserDefaults(locations)
        
        locationListView.tableView.reloadData()
        populateWeatherDataForLocations()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationAndWeatherPairs.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(LocationListTableViewCellIdentifier, forIndexPath: indexPath) as! LocationListTableViewCell
        let location = locationAndWeatherPairs[indexPath.row].location
        let weatherData = locationAndWeatherPairs[indexPath.row].weatherData
        
        cell.locationArrowImageView.hidden = !location.representsCurrentLocation
        cell.cityLabel.text = location.city
        
        if let weatherData = weatherData {
            cell.iconImageView.image = weatherData.condition?.icon()
            cell.tempLabel.text = "\(weatherData.temperature!)°"
            cell.summaryLabel.text = weatherData.summary
        }
        else {
            cell.iconImageView.image = nil
            cell.tempLabel.text = ""
            cell.summaryLabel.text = ""
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        let location = locationAndWeatherPairs[indexPath.row].location
        if location.representsCurrentLocation {
            return false
        }
        else {
            return true
        }
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            locationAndWeatherPairs.removeAtIndex(indexPath.row)
            let locationsToSave = locationAndWeatherPairs.map{ $0.0 }.filter { !$0.representsCurrentLocation }
            Location.saveLocationsToUserDefaults(locationsToSave)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    
    
    // Select city to view on ForecastView
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (locationAndWeatherPairs.count != 0){
            let location : Location = locationAndWeatherPairs[indexPath.row].location
            delegate?.didSelectLocationInLocationListViewController(self, didSelectLocation: location, useCelsius : useCelsius)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    /// MARK: LocationListViewDelegate methods
    
    func didTapAddLocationButtonInLocationListView(view: LocationListView) {
        let locationSearchViewController = LocationSearchViewController()
        locationSearchViewController.delegate = self
        self.navigationController?.pushViewController(locationSearchViewController, animated: true)
    }
    
    func didRequestWeatherRefreshInLocationListView(view: LocationListView) {
        clearAllWeatherData()
        populateWeatherDataForLocations()
    }
    
    
    func didTapUseCelsiusButtonInLocationListView(view: LocationListView, useCelsiusButtonSelected: Bool) {
        useCelsius = useCelsiusButtonSelected
        
        let savedUsedCelsius = UseCelsius(useCelsius: useCelsius)
        UseCelsius.saveDefaultUnitsToUserDefaults(savedUsedCelsius)
        
        clearAllWeatherData()
        populateWeatherDataForLocations()
    }
}



    