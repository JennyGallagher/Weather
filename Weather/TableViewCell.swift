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


let fontName = "Avenir-Black"

class LocationListTableViewCell: UITableViewCell {
    
    
    lazy var cityLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .fontColor()
        label.font = UIFont(name: fontName, size: 20.0)
        label.lineBreakMode = .ByTruncatingTail
        label.numberOfLines = 1
        return label
        }()
    
    lazy var summaryLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .fontColor()
        label.font = UIFont(name: fontName, size: 13)
        return label
        }()
    
    lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .fontColor()
        label.font = UIFont(name: fontName, size: 45)
        label.textAlignment = .Right
        return label
        }()
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .ScaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
        }()
    
    lazy var locationArrowImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .ScaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "LocationArrow")
        icon.hidden = true
        return icon
        }()
    
    required init(coder aDecoder: NSCoder) {
        
        fatalError("LocationListTableViewCell does not support initWithCoder")
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
        NSLayoutConstraint(
            item: cityLabel,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Leading,
            multiplier: 1, constant: 22).active = true
        
        NSLayoutConstraint(
            item: cityLabel,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Trailing,
            multiplier: 1, constant: -75).active = true
        
        NSLayoutConstraint(
            item: cityLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Top,
            multiplier: 1, constant: 14).active = true
        
        // summaryLabel constraints
        NSLayoutConstraint(
            item: summaryLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: iconImageView,
            attribute: .Right,
            multiplier: 1, constant: 8).active = true
        
        NSLayoutConstraint(
            item: summaryLabel,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Bottom,
            multiplier: 1, constant: -14).active = true
        
        // tempLabel constraints
        NSLayoutConstraint(
            item: tempLabel,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Trailing,
            multiplier: 1, constant: -10).active = true
        
        
        NSLayoutConstraint(
            item: tempLabel,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .CenterY,
            multiplier: 1, constant: 0).active = true
        
        // iconImage constraints
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Left,
            multiplier: 1, constant: 20).active = true
        
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Bottom,
            multiplier: 1, constant: -10).active = true
        
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 25).active = true
        
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 25).active = true
        
        // locationArrow constraints
        NSLayoutConstraint(
            item: locationArrowImageView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Left,
            multiplier: 1, constant: 5).active = true
        
        NSLayoutConstraint(
            item: locationArrowImageView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .Top,
            multiplier: 1, constant: 23).active = true
        
        NSLayoutConstraint(
            item: locationArrowImageView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 12).active = true
        
        NSLayoutConstraint(
            item: locationArrowImageView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 12).active = true
        
        
    }
    
}

class LocationSearchTableViewCell : UITableViewCell {
    
    let fontName = "Avenir-Heavy"
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset.right = separatorInset.left
        textLabel?.font = UIFont(name: self.fontName, size: 17)
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