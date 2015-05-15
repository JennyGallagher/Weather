//
//  TableViewCell.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/8/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

let LocationListTableViewCellIdentifier = "LocationListTableViewCellIdentifier"



class LocationListTableViewCell: UITableViewCell {
    
    
    
    lazy var cityLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = .customColor()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = " "
        label.textAlignment = NSTextAlignment.Left
        return label
        }()
    
    lazy var summaryLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = .customColor()
        label.font = UIFont(name: "Avenir-Black", size: 12.0)
        label.text = "Partly Cloudy"
        label.textAlignment = NSTextAlignment.Left
        return label
        }()
    
    lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = .customColor()
        label.font = UIFont(name: "Avenir-Black", size: 80.0)
        label.text = "80°"
        label.textAlignment = NSTextAlignment.Right
        return label
        }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImage(named: "fog")
        let icon = UIImageView(image: image)
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
            multiplier: 1, constant: 0).active = true
        
        let summaryLabelXConstraint: () = NSLayoutConstraint(
            item: self.summaryLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: iconImageView,
            attribute: .Right,
            multiplier: 1, constant: 5).active = true
        
        let summaryLabelYConstraint: () = NSLayoutConstraint(
            item: self.summaryLabel,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Bottom,
            multiplier: 1, constant: -3).active = true
        
        
        let tempLabelXConstraint: () = NSLayoutConstraint(
            item: self.tempLabel,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Right,
            multiplier: 1, constant: -10).active = true
        
        let tempLabelYConstraint: () = NSLayoutConstraint(
            item: self.tempLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Top,
            multiplier: 1, constant: -2).active = true
        
        
        let iconImageXContraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Left,
            multiplier: 1, constant: 10).active = true
        
        let iconImageYContraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: cityLabel,
            attribute: .Bottom,
            multiplier: 1, constant: 0).active = true
        
        let iconImageBottomContraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Bottom,
            multiplier: 1, constant: -5).active = true
        
        let iconImageWidthConstraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 15).active = true
        
        let iconImageHeightConstraints: () = NSLayoutConstraint(
            item: self.iconImageView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 15).active = true
        
        
    }
    
}