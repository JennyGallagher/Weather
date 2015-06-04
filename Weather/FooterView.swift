//
//  FooterView.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/14/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    
    lazy var lastLineSeparator : UIView! = {
        let view = UIView()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
        }()
    
    lazy var vibrancyEffectView : UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: UIBlurEffect()))
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.contentView.backgroundColor = UIColor.whiteColor()
        return view
        }()
    
    lazy var addLocationButton : UIButton! = {
        let button =  UIButton()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTitle("+", forState: .Normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleEdgeInsets = UIEdgeInsets(top: 7, left: 15, bottom: 55, right: 35)
        button.setTitleColor(UIColor.fontColor(), forState: .Normal)
        button.titleLabel?.font  = UIFont(name: "Avenir-Heavy", size: 32)
        return button
        }()
    
    
    lazy var useCelsiusButton : UIButton! = {
        let button =  UIButton()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTitle("°F", forState: .Normal)
        button.setTitle("°C", forState: .Selected)
        button.titleEdgeInsets = UIEdgeInsets(top: 15, left: 40, bottom: 60, right: 20)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.fontColor(), forState: .Normal)
        button.titleLabel?.font  = UIFont(name: "Avenir-Heavy", size: 25)
        return button
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(addLocationButton)
        addSubview(useCelsiusButton)
        addSubview(lastLineSeparator)
        lastLineSeparator.addSubview(vibrancyEffectView)
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
            multiplier: 1, constant: 0).active = true
        
        let addLocationButtonYConstraint: () = NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 0).active = true
        
        let addLocationButtonWidthConstraints: () = NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        let addLocationButtonHeightConstraints: () = NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        
        let changeUnitsButtonXConstraint: () = NSLayoutConstraint(
            item: useCelsiusButton,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: 0).active = true
        
        let changeUnitsButtonYConstraint: () = NSLayoutConstraint(
            item: useCelsiusButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: -0).active = true
        
        let changeUnitsButtonWidthConstraints: () = NSLayoutConstraint(
            item: useCelsiusButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        let changeUnitsButtonHeightConstraints: () = NSLayoutConstraint(
            item: useCelsiusButton,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        let lastLineSeperatorWidthConstraints: () = NSLayoutConstraint(
            item: lastLineSeparator,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Width,
            multiplier: 1, constant: 0).active = true
        
        let lastLineSeperatorHeightConstraints: () = NSLayoutConstraint(
            item: lastLineSeparator,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 1).active = true
        
        let vibrancyViewWidthConstraints: () = NSLayoutConstraint(
            item: vibrancyEffectView,
            attribute: .Width,
            relatedBy: .LessThanOrEqual,
            toItem: self,
            attribute: .Width,
            multiplier: 1, constant: -30).active = true
        
        let vibrancyViewHeightConstraints: () = NSLayoutConstraint(
            item: vibrancyEffectView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 0.5).active = true
        
        let vibrancyViewRightConstraint: () = NSLayoutConstraint(
            item: vibrancyEffectView,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: -15).active = true

        let vibrancyViewLeftConstraint: () = NSLayoutConstraint(
            item: vibrancyEffectView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 15).active = true
      
    }
    
}
