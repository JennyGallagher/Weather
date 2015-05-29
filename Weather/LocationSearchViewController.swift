//
//  LocationSearchViewController.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/6/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//




import UIKit
import CoreLocation



protocol LocationSearchViewControllerDelegate {
    func locationSearchViewController(controller: LocationSearchViewController, didAddNewLocation location: Location)
}

class LocationSearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var delegate : LocationSearchViewControllerDelegate? = nil
    
    var originalData : [String] = []
    var place_ids : [String] = []
    var filteredData : [String] = []
    var googlePlaceAPI = GooglePlaceAPI()
    
    let locations : [Location] = []
    
    
    let locationSearchView : LocationSearchView = {
        let colors = UIColor.pinkToPurle()
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
        
        (view as? LocationSearchView)?.tableView.reloadData()
    }
    
    
    private func prepareViewForInitialDataLoad() {
        (view as? LocationSearchView)?.tableView.dataSource = self
        (view as? LocationSearchView)?.tableView.delegate = self
        
    }
    
    // MARK:- UITableView methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        

        self.originalData.removeAll()
        self.place_ids.removeAll()
        googlePlaceAPI.fetchPlacesAutoComplete(locationSearchView.searchBar.text){ predictions in
            for prediction: Prediction in predictions {
                
                self.originalData.append(prediction.description)
                self.place_ids.append(prediction.place_id)
            }
            self.filteredData = self.originalData
            (self.view as? LocationSearchView)?.tableView.reloadData()
            
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(LocationSearchTableViewCellIdentifier, forIndexPath: indexPath) as! LocationSearchTableViewCell
        
        cell = LocationSearchTableViewCell()
        cell.textLabel!.text = self.filteredData[indexPath.row]
        
        return cell
    }
    

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var locationArray :  [Location] = []
        googlePlaceAPI.fetchPlacesDetail(place_ids[indexPath.row]){ place in
            
            var locationFromAddressSearch = Location(city: place!.city ?? "", state: place!.state ?? "", latitude: place!.coordinate.latitude, longitude: place!.coordinate.longitude)
            
            println("saved location \(locationFromAddressSearch)")
            
            self.delegate?.locationSearchViewController(self, didAddNewLocation: locationFromAddressSearch)
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}





