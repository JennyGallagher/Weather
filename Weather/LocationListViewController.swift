//
//  LocationListViewController.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/6/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit
import CoreLocation



protocol LocationListViewControllerDelegate {
    func didSelectLocationInLocationListViewController(controller: LocationListViewController, didSelectLocation location: Location, useCelsius : Bool)
    
}


class LocationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocationSearchViewControllerDelegate, LocationListViewDelegate, ChangeUnitsDelegate  {
    
    var delegate : LocationListViewControllerDelegate? = nil
    var useCelsius : Bool = false
    let locationController = LocationController()
    var locations : [Location] = []
    
    let locationListView : LocationListView = {
        let colors = UIColor.tealToPurple()
        let view = LocationListView(topColor: colors.topColor, bottomColor: colors.bottomColor)
        return view
        }()
    
    
    override func loadView() {
        view = locationListView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewForInitialDataLoad()
        
    }
    
    
    private func prepareViewForInitialDataLoad() {
        (view as? LocationListView)?.delegate = self
        (view as? LocationListView)?.unitsDelegate = self
        (view as? LocationListView)?.tableView.dataSource = self
        (view as? LocationListView)?.tableView.delegate = self
        
    }
    
    
    func locationSearchViewController(controller: LocationSearchViewController, didAddNewLocation location: Location) {
        self.locations.append(location)
        
        (view as? LocationListView)?.tableView.reloadData()
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.locations.count == 0 {
            return 1
        }
        else {
            return self.locations.count
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(LocationListTableViewCellIdentifier, forIndexPath: indexPath) as! LocationListTableViewCell
        cell = LocationListTableViewCell()
        
        
        if indexPath.row == 0 && self.locations.isEmpty {
            
            self.locationController.retrieveLocations({location, success in
                if success {
                    self.locationController.requestWeatherDataForLocation(location!, useCelsius: self.useCelsius, completion: { success, weather in
                        cell.cityLabel.text =  "\(location!.city)"
                        cell.iconImageView.image = weather.condition?.icon()
                        cell.tempLabel.text = "\(weather.temperature!)°"
                        cell.summaryLabel.text = weather.summary
                        cell.locationArrowImageView.image = UIImage(named: "arrow8")
                        self.locations.append(location!)
                        }
                    )}
            })
        }
            
        else {
            
            cell.cityLabel.text = ""
            cell.iconImageView.image = nil
            cell.tempLabel.text = ""
            cell.summaryLabel.text = ""
            
            let location : Location = self.locations[indexPath.row]
            
            cell.cityLabel.text = "\(location.city)"
            
            if indexPath.row == 0{
                
                // Current location arrow image is only applied to the first cell
                cell.locationArrowImageView.image = UIImage(named: "arrow8")}
            
            locationController.requestWeatherDataForLocation(location, useCelsius: useCelsius, completion: { success, weather in
                if tableView.cellForRowAtIndexPath(indexPath) == cell {
                    cell.iconImageView.image = weather.condition?.icon()
                    cell.tempLabel.text = "\(weather.temperature!)°"
                    cell.summaryLabel.text = weather.summary
                }
            })
        }
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        if indexPath.row == 0 {
            return false
        }
        else {
            return true
        }
    }
    
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.locations.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    
    
    // Select city to view on ForecastView
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (locations.count != 0){
            let location : Location = self.locations[indexPath.row]
            self.delegate?.didSelectLocationInLocationListViewController(self, didSelectLocation: location, useCelsius : useCelsius)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    /// MARK: LocationListViewDelegate methods
    
    func didTapAddLocationButtonInLocationListView(view: LocationListView) {
        let locationSearchViewController = LocationSearchViewController()
        locationSearchViewController.delegate = self
        self.navigationController?.pushViewController(locationSearchViewController, animated: true)
    }
    
    func didTapUseCelsiusButton(view: LocationListView, useCelsius: Bool, useCelsiusButtonSelected: Bool) {
        var useCelsiusButtonSelected = useCelsiusButtonSelected
        dispatch_async(dispatch_get_main_queue(), { ()
            if useCelsiusButtonSelected == true {
                self.useCelsius = true
            }
            else{
                self.useCelsius = false
            }
            view.tableView.reloadData()
        })
    }
    
}



    