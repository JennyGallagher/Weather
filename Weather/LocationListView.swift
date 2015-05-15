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
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect())
        tableView.backgroundColor = UIColor.clearColor()
        
        let footerView = FooterView(frame: CGRectMake(0, 0, tableView.frame.size.width, 100.0))
        footerView.addLocationButton.addTarget(self, action: "addLocationButtonTapped:", forControlEvents: .TouchUpInside)
        tableView.tableFooterView = footerView
        
        tableView.preservesSuperviewLayoutMargins = false
        return tableView
        }()
    
    
    override init(topColor: UIColor, bottomColor: UIColor) {
        super.init(topColor: topColor, bottomColor: bottomColor)
        addSubview(blurView)
        addSubview(tableView)
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
            item: self.tableView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
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
    }
    
    func addLocationButtonTapped(sender : UIButton!){
        self.delegate?.didTapAddLocationButtonInLocationListView(self)
    }
}



