//
//  LocationSearchView.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/8/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit




class LocationSearchView: GradientView {
    
    
    
    lazy var blurView : BlurView = {
        let blurView = BlurView()
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return blurView
        }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.registerClass(LocationSearchTableViewCell.self, forCellReuseIdentifier: LocationSearchTableViewCellIdentifier)
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        tableView.estimatedRowHeight = 75
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect())
        tableView.backgroundColor = UIColor.clearColor()
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.preservesSuperviewLayoutMargins = false
        return tableView
        }()
    
    lazy var googleLogo : UIImageView! = {
        let imageView = UIImageView(image: UIImage(named: "powered-by-google-on-white"))
        
        imageView.contentMode = .ScaleAspectFit
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return imageView
        }()
    
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
    
    override init(topColor: UIColor, bottomColor: UIColor) {
        super.init(topColor: topColor, bottomColor: bottomColor)
        addSubview(blurView)
        addSubview(tableView)
        addSubview(searchBar)
        tableView.addSubview(googleLogo)
        configureConstraints()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureConstraints(){
        
        let blurViewTopConstraint: () = NSLayoutConstraint(
            item: blurView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 0).active = true
        
        let blurViewBottomConstraint: () = NSLayoutConstraint(
            item: blurView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: 0).active = true
        
        let blurViewLeftConstraint: () = NSLayoutConstraint(
            item: blurView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 0).active = true
        
        let blurViewRightConstraint: () = NSLayoutConstraint(
            item: blurView,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: 0).active = true
        
        
        let tableViewTopConstraint: () = NSLayoutConstraint(
            item: self.tableView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: searchBar,
            attribute: .Bottom,
            multiplier: 1, constant: 0).active = true
        
        let tableViewBottomConstraint: () = NSLayoutConstraint(
            item: self.tableView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: 0).active = true
        
        let tableViewLeftConstraint: () = NSLayoutConstraint(
            item: self.tableView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 0).active = true
        
        let tableViewRightConstraint: () = NSLayoutConstraint(
            item: self.tableView,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: 0).active = true
        
        let searchBarAboveTableViewConstraint: () = NSLayoutConstraint(
            item: self.searchBar,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 0).active = true
        
        let googleLogoXConstraint:() = NSLayoutConstraint(
            item: googleLogo,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: -5).active = true
        
        let googleLogoYConstraint:() = NSLayoutConstraint(
            item: googleLogo,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: -5).active = true
        
    }
    
    
}
