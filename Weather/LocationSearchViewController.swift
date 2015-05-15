//
//  LocationSearchViewController.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/6/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//




import UIKit
import CoreLocation


protocol SearchViewControllerDelegate {
    func searchViewAddNewLocation(location : Location)
}

class LocationSearchViewController: UITableViewController, UISearchBarDelegate {
    //    Adding code to test "SearchController" from GitHub
    
    var delegate : SearchViewControllerDelegate? = nil
    
    var originalData : [String] = []
    var place_ids : [String] = []
    var filteredData : [String] = []
    var googlePlaceAPI = GooglePlaceAPI()
    var selectedIndex = NSIndexPath()
    var selected : Bool!
    
    //     End test code
    let locations : [Location] = []
    //    let locationController = LocationController()
    //    let locationSearchView = LocationSearchView()
    let identifier = "Cell"
    
    let locationSearchView : LocationSearchView = {
        let colors = UIColor.yellowToPinkColor()
        let view = LocationSearchView(topColor: colors.topColor, bottomColor: colors.bottomColor)
        return view
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = locationSearchView
        
        // Register cell class for the identifier.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.identifier)
        
        locationSearchView.searchBar.delegate = self
        tableView.tableHeaderView = locationSearchView.searchBar
        
        
        // Adding footer to remove extra row lines
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        self.tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect())
        
        definesPresentationContext = true
        
        self.tableView.reloadData()
    }
    
    
    // MARK:- UITableView methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        println("updateSearchResultsForSearchController")
        selected = false
        self.originalData.removeAll()
        self.place_ids.removeAll()
        googlePlaceAPI.fetchPlacesAutoComplete(locationSearchView.searchBar.text){ predictions in
            for prediction: Prediction in predictions {
                
                //      self.sectionData.append(prediction.description)
                self.originalData.append(prediction.description)
                self.place_ids.append(prediction.place_id)
            }
            self.filteredData = self.originalData
            self.tableView.reloadData()
        }
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell;
        cell.textLabel!.text = self.filteredData[indexPath.row]
        
        //        var location = searchResults[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.textColor = .customColor()
        cell.selectionStyle = .None
        
        //        cell.textLabel!.text = "\(location.city), \(location.state)"
        
        return cell
    }
    
    
    
    //    // SeperatorInsets go to left and right edges
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath)
    {
        // Remove seperator inset
        cell.separatorInset = UIEdgeInsetsZero
        
        // Prevent the cell from inheriting the Table View's margin settings
        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
            cell.preservesSuperviewLayoutMargins = false
        }
        
        // Explictly set your cell's layout margins
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath
        selected = true
        
        var locationArray :  [Location] = []
        googlePlaceAPI.fetchPlacesDetail(place_ids[selectedIndex.row]){ place in
            
            var locationFromAddressSearch = Location(city: place!.city ?? "", state: place!.state ?? "", latitude: place!.coordinate.latitude, longitude: place!.coordinate.longitude)
            
            println("saved location \(locationFromAddressSearch)")
            
            if self.delegate != nil {
                let location = locationFromAddressSearch
                self.delegate?.searchViewAddNewLocation(location)
                
            }
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}





