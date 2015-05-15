//
//  LocationSearchView.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/8/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

class LocationSearchView: GradientView {
    
    lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.searchBarStyle = .Minimal
        searchBar.placeholder = "Add a City, State or Zip Code"
        searchBar.showsCancelButton = true
        searchBar.autocapitalizationType = .Words
        searchBar.returnKeyType = .Search
        searchBar.tintColor = .customColor()
        searchBar.becomeFirstResponder()
        
        // Customizing searchbar text color
        var textFieldInsideSearchBar : UITextField? = nil
        for subview in searchBar.subviews {
            for subSubview in subview.subviews {
                if let textField = subSubview as? UITextField {
                    textFieldInsideSearchBar = textField
                }
            }
        }
        textFieldInsideSearchBar?.textColor = .customColor()
        return searchBar
        }()
    
    
}
