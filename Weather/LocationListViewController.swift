//
//  LocationListViewController.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/6/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit
import CoreLocation


class LocationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocationSearchViewControllerDelegate, LocationListViewDelegate  {
    
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
        (view as? LocationListView)?.delegate = self
        (view as? LocationListView)?.tableView.dataSource = self
        (view as? LocationListView)?.tableView.delegate = self
        
    }
    
    func locationSearchViewController(controller: LocationSearchViewController, didAddNewLocation location: Location) {
        self.locations.append(location)
        (view as? LocationListView)?.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.locations.isEmpty {
            return 1
        }
        else {
            return self.locations.count
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(LocationListTableViewCellIdentifier, forIndexPath: indexPath) as! LocationListTableViewCell
                    cell = LocationListTableViewCell()
        
        if self.locations.isEmpty {

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
    
    
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.locations.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func respondToButtonClick(sender:UIButton!){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /// MARK: LocationListViewDelegate methods
    
    func didTapAddLocationButtonInLocationListView(view: LocationListView) {
        let locationSearchViewController = LocationSearchViewController()
        locationSearchViewController.delegate = self
        self.navigationController?.pushViewController(locationSearchViewController, animated: true)
    }
    
}



    