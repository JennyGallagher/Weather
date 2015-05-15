//
//  LocationListViewController.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/6/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit
import CoreLocation


class LocationListViewController: UITableViewController, SearchViewControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let locationListView : LocationListView = {
        let colors = UIColor.yellowToPinkColor()
        let view = LocationListView(topColor: colors.topColor, bottomColor: colors.bottomColor)
        return view
        }()

    
    var locations : [Location] = []
    
    override func loadView() {
        view = locationListView
            }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewForInitialDataLoad()
    }
    
    
    private func prepareViewForInitialDataLoad() {
        (view as? LocationListView)?.tableView.dataSource = self
        (view as? LocationListView)?.tableView.delegate = self
        
    }
    
    func searchViewAddNewLocation(location: Location) {
        self.locations.append(location)
        self.tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.locations.isEmpty {
            return 5
        }
        else {
            return self.locations.count
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(LocationListTableViewCellIdentifier, forIndexPath: indexPath) as! LocationListTableViewCell
        
        
        if self.locations.isEmpty {
            cell = LocationListTableViewCell()
            cell.cityLabel.text = "Add a new city"
            
        }
        else {
            
            let location : Location = self.locations[indexPath.row]
            cell.cityLabel.text = "\(location.city),  \(location.state)"
            
            //
            //            let currentLocationLatString : String = "\(location.latitude.description)"
            //            let currentLocationLongString : String = "\(location.longitude.description)"
            //            forecastURL = "\(currentLocationLatString),\(currentLocationLongString)"
            //
            //
            //            locationController.requestWeatherDataForCity({ (success, weather) -> Void in
            //                cell.cityLabel.text = "\(weather.currentCity!),  \(weather.currentState!)"
            //                cell.iconImageView.image = weather.condition?.icon()
            //                cell.tempLabel.text = "\(weather.temperature!)°"
            //                cell.summaryLabel.text = weather.summary
            //            })
            
        }
        
        return cell
    }
    
    
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.locations.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func addLocationButtonTouched(sender: UIButton!) {
        let locationSearchViewController = LocationSearchViewController()
        locationSearchViewController.delegate = self
        self.navigationController?.pushViewController(locationSearchViewController, animated: true)
    }
    
    
    func respondToButtonClick(sender:UIButton!){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}



    