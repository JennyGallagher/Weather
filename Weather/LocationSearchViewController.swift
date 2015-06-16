//
//  LocationSearchViewController.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/6/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//




import UIKit
import CoreLocation



protocol LocationSearchViewControllerDelegate : class {
    func locationSearchViewController(controller: LocationSearchViewController, didAddNewLocation location: Location)
}

class LocationSearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate : LocationSearchViewControllerDelegate? = nil
    
    var originalData : [String] = []
    var place_ids : [String] = []
    var filteredData : [String] = []
    var googlePlaceAPI = GooglePlaceAPI()
    
    let locations : [Location] = []
    
    
    let locationSearchView : LocationSearchView = {
        let colors = UIColor.yellowToPinkColor()
        let view = LocationSearchView(topColor: colors.topColor, bottomColor: colors.bottomColor)
        return view
        }()
    
    
    override func loadView() {
        view = locationSearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewForInitialDataLoad()

        
        locationSearchView.searchBar.delegate = self
        
        locationSearchView.tableView.reloadData()
    }
    
    
    private func prepareViewForInitialDataLoad() {
        locationSearchView.tableView.dataSource = self
        locationSearchView.tableView.delegate = self
        
    }
    
    // MARK:- UITableView methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        

        originalData.removeAll()
        place_ids.removeAll()
        googlePlaceAPI.fetchPlacesAutoComplete(locationSearchView.searchBar.text){ predictions in
            for prediction: Prediction in predictions {
                
                
                self.originalData.append(prediction.description)
                self.place_ids.append(prediction.place_id)
                
            }
            
            self.filteredData = self.originalData
            
            self.locationSearchView.tableView.reloadData()
            
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(LocationSearchTableViewCellIdentifier, forIndexPath: indexPath) as! LocationSearchTableViewCell
        
        cell = LocationSearchTableViewCell()
        
    
        
        cell.textLabel!.text = self.filteredData[indexPath.row]
        
        
        return cell
    }
    

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let locationArray :  [Location] = []
        googlePlaceAPI.fetchPlacesDetail(place_ids[indexPath.row]){ place in
            
            let locationFromAddressSearch = Location(city: place!.city ?? "", state: place!.state ?? "", latitude: place!.coordinate.latitude, longitude: place!.coordinate.longitude, representsCurrentLocation: false)
            
            println("saved location \(locationFromAddressSearch)")
            
            self.delegate?.locationSearchViewController(self, didAddNewLocation: locationFromAddressSearch)
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}





