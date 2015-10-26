//
//  FooterView.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/14/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit


class FooterView: UIView {
    

    
    let fontName = "Avenir-Heavy"
    
    
    lazy var lastLineSeparator : UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
    lazy var vibrancyEffectView : UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: UIBlurEffect()))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentView.backgroundColor = UIColor.whiteColor()
        return view
        }()
    
    lazy var addLocationButton : UIButton! = {
        let button =  UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", forState: .Normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 7, left: 15, bottom: 55, right: 35)
        button.setTitleColor(UIColor.fontColor(), forState: .Normal)
        button.titleLabel?.font  = UIFont(name: self.fontName, size: 32)
        return button
        }()
    
    
    lazy var useCelsiusButton : UIButton! = {
        let button =  UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if let defaultUseCelsius =
            UseCelsius.restoreSavedDefaultUnitFromUserDefaults() {
                var useCelsius : Bool = false
                useCelsius = defaultUseCelsius.useCelsius
                if useCelsius {
                    button.selected = true
                }}
        button.setTitle("°F", forState: .Normal)
        button.setTitle("°C", forState: .Selected)
        button.titleEdgeInsets = UIEdgeInsets(top: 15, left: 40, bottom: 60, right: 20)
        button.setTitleColor(UIColor.fontColor(), forState: .Normal)
        button.titleLabel?.font  = UIFont(name: self.fontName, size: 25)
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
        // addLocationButton constraints
        NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        NSLayoutConstraint(
            item: addLocationButton,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        // changeUnitsButton constraints
        NSLayoutConstraint(
            item: useCelsiusButton,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: useCelsiusButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: useCelsiusButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        NSLayoutConstraint(
            item: useCelsiusButton,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        // lastLineSeperator constraints
        NSLayoutConstraint(
            item: lastLineSeparator,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Width,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: lastLineSeparator,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 1).active = true
        
        // vibrancyView constraints
        NSLayoutConstraint(
            item: vibrancyEffectView,
            attribute: .Width,
            relatedBy: .GreaterThanOrEqual,
            toItem: lastLineSeparator,
            attribute: .Width,
            multiplier: 1, constant: -30).active = true
        
        NSLayoutConstraint(
            item: vibrancyEffectView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 0.5).active = true
        
        NSLayoutConstraint(
            item: vibrancyEffectView,
            attribute: .Right,
            relatedBy: .GreaterThanOrEqual,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: -15).active = true

        NSLayoutConstraint(
            item: vibrancyEffectView,
            attribute: .Left,
            relatedBy: .GreaterThanOrEqual,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 15).active = true
      
    }
    

}
