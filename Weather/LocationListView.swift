//
//  LocationListView.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/28/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

/// Protocol containing the method signatures for the LocationListViewDelegate.
protocol LocationListViewDelegate : class {
    func didTapAddLocationButtonInLocationListView(view: LocationListView)
    func didRequestWeatherRefreshInLocationListView(view: LocationListView)
    func didTapUseCelsiusButtonInLocationListView(view: LocationListView, useCelsiusButtonSelected : Bool)
}

class LocationListView: GradientView {
    
    weak var delegate : LocationListViewDelegate?
    
    lazy var blurView : BlurView = {
        let blurView = BlurView()
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return blurView
        }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.registerClass(LocationListTableViewCell.self, forCellReuseIdentifier: LocationListTableViewCellIdentifier)
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        tableView.rowHeight = 75
        tableView.estimatedRowHeight = 75
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect())
        tableView.backgroundColor = UIColor.clearColor()
        
        
        let footerView = FooterView(frame: CGRectMake(0, 0, tableView.frame.size.width, 100.0))
        footerView.backgroundColor = UIColor.clearColor()
        footerView.addLocationButton.addTarget(self, action: "addLocationButtonTapped:", forControlEvents: .TouchUpInside)
        footerView.useCelsiusButton.addTarget(self, action: "useCelsiusButtonTapped:", forControlEvents: .TouchUpInside)
        tableView.tableFooterView = footerView
        
        
        tableView.preservesSuperviewLayoutMargins = false
        return tableView
        }()
    
    
    lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshTableView:", forControlEvents: .ValueChanged)
        return refreshControl
        
        }()
    
    
    override init(topColor: UIColor, bottomColor: UIColor) {
        super.init(topColor: topColor, bottomColor: bottomColor)
        addSubview(blurView)
        addSubview(tableView)
        tableView.addSubview(refreshControl)
        configureConstraints()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureConstraints(){
        // Blurred background constraints.
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
        
        // Table view constraints.
        let tableViewTopConstraint: () = NSLayoutConstraint(
            item: tableView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 2).active = true
        
        let tableViewBottomConstraint: () = NSLayoutConstraint(
            item: tableView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: 0).active = true
        
        let tableViewLeftConstraint: () = NSLayoutConstraint(
            item: tableView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 0).active = true
        
        let tableViewRightConstraint: () = NSLayoutConstraint(
            item: tableView,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: 0).active = true
        
    }
    
    func addLocationButtonTapped(sender : UIButton!){
        delegate?.didTapAddLocationButtonInLocationListView(self)
    }
    
    
    func useCelsiusButtonTapped(sender: UIButton!){
        sender.selected = !sender.selected
        var useCelsiusButtonSelected = sender.selected
        delegate?.didTapUseCelsiusButtonInLocationListView(self, useCelsiusButtonSelected: useCelsiusButtonSelected)
    }
    
    
    func refreshTableView(sender : AnyObject){
        dispatch_async(dispatch_get_main_queue(), { ()
            self.delegate?.didRequestWeatherRefreshInLocationListView(self)
        })
    }
}



