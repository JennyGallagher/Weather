//
//  LocationListView.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/28/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit



class LocationListView: GradientView {
    

    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.registerClass(LocationListTableViewCell.self, forCellReuseIdentifier: LocationListTableViewCellIdentifier)
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect())
        tableView.backgroundColor = UIColor.yellowColor()
        
        let footerView = FooterView(frame: CGRectMake(0, 0, tableView.frame.size.width, 100.0))
        footerView.addLocationButton.addTarget(self, action: "addLocationButtonTapped:", forControlEvents: .TouchUpInside)
        tableView.tableFooterView = footerView
        
        tableView.preservesSuperviewLayoutMargins = false
        return tableView
        }()
    
    
    override init(topColor: UIColor, bottomColor: UIColor) {
        super.init(topColor: topColor, bottomColor: bottomColor)
        addSubview(tableView)
        configureConstraints()
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureConstraints(){
        let tableViewTopConstraint: () = NSLayoutConstraint(
            item: self.tableView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 20).active = true
        
        let tableViewBottomConstraint: () = NSLayoutConstraint(
            item: self.tableView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: 20).active = true
        
        let tableViewLeftConstraint: () = NSLayoutConstraint(
            item: self.tableView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 20).active = true
    
        let tableViewRightConstraint: () = NSLayoutConstraint(
            item: self.tableView,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: -20).active = true
    }
    
}



