//
//  TableViewCell.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/8/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

let LocationListTableViewCellIdentifier = "LocationListTableViewCellIdentifier"
let LocationSearchTableViewCellIdentifier = "LocationSearchTableViewCellIdentifier"


class LocationListTableViewCell: UITableViewCell {
    
    
    lazy var cityLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = .customColor()
        label.font = UIFont(name: "Avenir-Black", size: 21.0)
        label.textAlignment = NSTextAlignment.Left
        return label
        }()
    
    lazy var summaryLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = .customColor()
        label.font = UIFont(name: "Avenir-Black", size: 13)
        label.textAlignment = NSTextAlignment.Left
        return label
        }()
    
    lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = .customColor()
        label.font = UIFont(name: "Avenir-Black", size: 45)
        label.textAlignment = NSTextAlignment.Right
        return label
        }()
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .ScaleAspectFit
        icon.setTranslatesAutoresizingMaskIntoConstraints(false)
        return icon
        }()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset = UIEdgeInsetsZero
        layoutMargins = UIEdgeInsetsZero
        selectionStyle = .None
        preservesSuperviewLayoutMargins = false
        backgroundColor = UIColor.clearColor()
        configureSubviews()
        configureConstraints()
        
    }
    
    
    
    private func configureSubviews(){
        contentView.addSubview(cityLabel)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(tempLabel)
        
    }
    
    private func configureConstraints() {
        
        // cityLabel constraints
        let cityLabelXConstraint: () = NSLayoutConstraint(
            item: self.cityLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Left,
            multiplier: 1, constant: 10).active = true
        
        let cityLabelYConstraint: () = NSLayoutConstraint(
            item: self.cityLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Top,
            multiplier: 1, constant: 14).active = true
        
        // summaryLabel constraints
        let summaryLabelXConstraint: () = NSLayoutConstraint(
            item: self.summaryLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: iconImageView,
            attribute: .Right,
            multiplier: 1, constant: 8).active = true
        
        let summaryLabelYConstraint: () = NSLayoutConstraint(
            item: self.summaryLabel,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Bottom,
            multiplier: 1, constant: -14).active = true
        
        // tempLabel constraints
        let tempLabelXConstraint: () = NSLayoutConstraint(
            item: self.tempLabel,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Right,
            multiplier: 1, constant: -10).active = true
        
        let tempLabelYConstraint: () = NSLayoutConstraint(
            item: self.tempLabel,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .CenterY,
            multiplier: 1, constant: 0).active = true
        
        // iconImage constraints
        let iconImageXContraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Left,
            multiplier: 1, constant: 10).active = true
        
        let iconImageYContraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Bottom,
            multiplier: 1, constant: -10).active = true
        
        let iconImageWidthConstraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 25).active = true
        
        let iconImageHeightConstraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 25).active = true
        
        
    }
    
}

class LocationSearchTableViewCell : UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset = UIEdgeInsetsZero
        layoutMargins = UIEdgeInsetsZero
        selectionStyle = .None
        preservesSuperviewLayoutMargins = false
        backgroundColor = UIColor.clearColor()
        textLabel?.textColor = UIColor.customColor()
        selectionStyle = .None
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}