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
        label.textColor = .fontColor()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.lineBreakMode = .ByTruncatingTail
        label.numberOfLines = 1
        return label
        }()
    
    lazy var summaryLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = .fontColor()
        label.font = UIFont(name: "Avenir-Black", size: 13)
        return label
        }()
    
    lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = .fontColor()
        label.font = UIFont(name: "Avenir-Black", size: 45)
        label.textAlignment = .Right
        return label
        }()
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .ScaleAspectFit
        icon.setTranslatesAutoresizingMaskIntoConstraints(false)
        return icon
        }()
    
    lazy var locationArrowImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .ScaleAspectFit
        icon.setTranslatesAutoresizingMaskIntoConstraints(false)
        icon.image = UIImage(named: "LocationArrow")
        icon.hidden = true
        return icon
        }()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        separatorInset = UIEdgeInsetsZero
        separatorInset.right = separatorInset.left
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
        contentView.addSubview(locationArrowImageView)
        
    }
    
    private func configureConstraints() {
        
        // cityLabel constraints
        let cityLabelLeftConstraint: () = NSLayoutConstraint(
            item: cityLabel,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Left,
            multiplier: 1, constant: 22).active = true
        
        let cityLabelRightConstraint: () = NSLayoutConstraint(
            item: cityLabel,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Right,
            multiplier: 1, constant: -75).active = true
        
        let cityLabelTopConstraint: () = NSLayoutConstraint(
            item: cityLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Top,
            multiplier: 1, constant: 14).active = true
        
        // summaryLabel constraints
        let summaryLabelXConstraint: () = NSLayoutConstraint(
            item: summaryLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: iconImageView,
            attribute: .Right,
            multiplier: 1, constant: 8).active = true
        
        let summaryLabelYConstraint: () = NSLayoutConstraint(
            item: summaryLabel,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Bottom,
            multiplier: 1, constant: -14).active = true
        
        // tempLabel constraints
        let tempLabelRightConstraint: () = NSLayoutConstraint(
            item: tempLabel,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Right,
            multiplier: 1, constant: -10).active = true
    
        
        let tempLabelYConstraint: () = NSLayoutConstraint(
            item: tempLabel,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .CenterY,
            multiplier: 1, constant: 0).active = true
        
        // iconImage constraints
        let iconImageXContraints: () = NSLayoutConstraint(
            item: iconImageView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Left,
            multiplier: 1, constant: 20).active = true
        
        let iconImageYContraints: () = NSLayoutConstraint(
            item: iconImageView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Bottom,
            multiplier: 1, constant: -10).active = true
        
        let iconImageWidthConstraints: () = NSLayoutConstraint(
            item: iconImageView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 25).active = true
        
        let iconImageHeightConstraints: () = NSLayoutConstraint(
            item: iconImageView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 25).active = true
        
        // locationArrow constraints
        
        // iconImage constraints
        let locationArrowImageXContraints: () = NSLayoutConstraint(
            item: locationArrowImageView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Left,
            multiplier: 1, constant: 5).active = true
        
        let locationArrowImageYContraints: () = NSLayoutConstraint(
            item: locationArrowImageView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Top,
            multiplier: 1, constant: 23).active = true
        
        let locationArrowImageWidthConstraints: () = NSLayoutConstraint(
            item: locationArrowImageView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 12).active = true
        
        let locationArrowImageHeightConstraints: () = NSLayoutConstraint(
            item: locationArrowImageView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 12).active = true
        
        
    }
    
}

class LocationSearchTableViewCell : UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        separatorInset = UIEdgeInsetsZero
        separatorInset.right = separatorInset.left
        textLabel?.font = UIFont(name: "Avenir-Heavy", size: 19)
        layoutMargins = UIEdgeInsetsZero
        selectionStyle = .None
        preservesSuperviewLayoutMargins = false
        backgroundColor = UIColor.clearColor()
        textLabel?.textColor = UIColor.fontColor()
               
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}