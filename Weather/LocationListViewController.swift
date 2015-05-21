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
    func didSelectLocationInLocationListViewController(controller: LocationListViewController, didSelectLocation location: Location)
    
}


class LocationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocationSearchViewControllerDelegate, LocationListViewDelegate  {
    
    var delegate : LocationListViewControllerDelegate? = nil
    
    let locationListView : LocationListView = {
        let colors = UIColor.miamiViceColors()
        let view = LocationListView(topColor: colors.topColor, bottomColor: colors.bottomColor)
        return view
        }()
    
    let locationController = LocationController()
    
    var locations : [Location] = []
    
    override func loadView() {
        view = locationListView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewForInitialDataLoad()
        
    }
    
    
    private func prepareViewForInitialDataLoad() {
        (view as? LocationListView)?.delegate = self
        (view as? LocationListView)?.tableView.dataSource = self
        (view as? LocationListView)?.tableView.delegate = self
        
    }
    
    func locationSearchViewController(controller: LocationSearchViewController, didAddNewLocation location: Location) {
        self.locations.append(location)
        (view as? LocationListView)?.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return (self.locations.count + 1)

    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(LocationListTableViewCellIdentifier, forIndexPath: indexPath) as! LocationListTableViewCell
        cell = LocationListTableViewCell()

        if indexPath.row == 0 {
         cell.userInteractionEnabled = false
            self.locationController.retrieveLocations({location, success in
                if success {
                    self.locationController.requestWeatherDataForLocation(location!, completion: { success, weather in
                            cell.cityLabel.text =  "\(location!.city), \(location!.state)"
                            cell.iconImageView.image = weather.condition?.icon()
                            cell.tempLabel.text = "\(weather.temperature!)°"
                            cell.summaryLabel.text = weather.summary
                    }
                )}
            })
            
        }
        else {
            if indexPath.row != 0 {
            cell.cityLabel.text = ""
            cell.iconImageView.image = nil
            cell.tempLabel.text = ""
            cell.summaryLabel.text = ""
            
            let location : Location = self.locations[(indexPath.row-1)]
            cell.cityLabel.text = "\(location.city), \(location.state)"
            
            locationController.requestWeatherDataForLocation(location, completion: { success, weather in
                if tableView.cellForRowAtIndexPath(indexPath) == cell {
                    cell.iconImageView.image = weather.condition?.icon()
                    cell.tempLabel.text = "\(weather.temperature!)°"
                    cell.summaryLabel.text = weather.summary
                }
            })
        }
        }
        
        return cell
    }
    
    
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        if self.locations.isEmpty  {
            
            return false
        }
        else {
            return true
        }
    }
    
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.locations.removeAtIndex(indexPath.row-1)
            if (self.locations.count != 0){
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            }
            else {
                
                tableView.reloadData()
                
            }
        }
    }
    
    
    // Select city to view on ForecastView
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let location : Location = self.locations[indexPath.row]
        self.delegate?.didSelectLocationInLocationListViewController(self, didSelectLocation: location)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    /// MARK: LocationListViewDelegate methods
    
    func didTapAddLocationButtonInLocationListView(view: LocationListView) {
        let locationSearchViewController = LocationSearchViewController()
        locationSearchViewController.delegate = self
        self.navigationController?.pushViewController(locationSearchViewController, animated: true)
    }
    
}



    