//
//  FooterView.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/14/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    
    lazy var addLocationButton : UIButton! = {
        let button =  UIButton(frame: CGRectMake(0, 0, 40, 40))
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTitle("+", forState: .Normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.customColor(), forState: UIControlState.Normal)
        button.titleLabel?.font  = UIFont(name: "Avenir-Heavy", size: 32)
        return button
        }()
    
    
    lazy var changeUnitsButton : UIButton! = {
        let button =  UIButton(frame: CGRectMake(0, 0, 40, 40))
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTitle("°F", forState: .Normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.customColor(), forState: UIControlState.Normal)
        button.titleLabel?.font  = UIFont(name: "Avenir-Heavy", size: 25)
        return button
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(addLocationButton)
        addSubview(changeUnitsButton)
        configureConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints(){
        let addLocationButtonXConstraint: () = NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 25).active = true
        
        let addLocationButtonYConstraint: () = NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 0).active = true
        
        let changeUnitsButtonXConstraint: () = NSLayoutConstraint(
            item: changeUnitsButton,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: -25).active = true
        
        let changeUnitsButtonYConstraint: () = NSLayoutConstraint(
            item: changeUnitsButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 4).active = true
        
        
    }
    
}
