//
//  View.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/4/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//



import UIKit



class ForecastView: GradientView {
    
    let fontColor : UIColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.85)
    
    let fontName = "Avenir-Black"
    
    
    lazy var cityLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = self.fontColor
        label.font = UIFont(name: self.fontName, size: 32.0)
        label.textAlignment = .Center
        label.lineBreakMode = .ByWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    lazy var cityListViewButton: UIButton! = {
        let image = UIImage(named: "List Filled-64")
        let button = UIButton()
        button.imageEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
        button.alpha = 0.65
        button.translatesAutoresizingMaskIntoConstraints = false
        button.adjustsImageWhenHighlighted = false
        button.setImage(image, forState: .Normal)
        button.hidden = true
        return button
        }()
    
    lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = self.fontColor
        label.font = UIFont(name: self.fontName, size: 130.0)
        label.textAlignment = .Center
        return label
        }()
    
    lazy var tempMinMaxLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = self.fontColor
        label.font = UIFont(name: self.fontName, size: 18.0)
        label.textAlignment = .Left
        return label
        }()
    
    lazy var summaryLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = self.fontColor
        label.font = UIFont(name: self.fontName, size: 21.0)
        label.textAlignment = .Left
        return label
        }()
    
    lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .ScaleAspectFit
        icon.alpha = 0.85
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
        }()
    
    lazy var activityIndicatorView : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.activityIndicatorViewStyle = .WhiteLarge
        view.alpha = 0.85
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()

    
    override init(topColor: UIColor, bottomColor: UIColor) {
        
        super.init(topColor: topColor, bottomColor: bottomColor)
        
        addSubview(cityLabel)
        addSubview(tempLabel)
        addSubview(tempMinMaxLabel)
        addSubview(iconImage)
        addSubview(summaryLabel)
        addSubview(cityListViewButton)
        addSubview(activityIndicatorView)
        configureConstraints()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    
    func configureConstraints(){
       
        //tempLabel constraints
        NSLayoutConstraint(
            item: tempLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: tempLabel,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1, constant: 0).active = true
        
        //cityLabel constraints
        NSLayoutConstraint(
            item: cityLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: cityLabel,
            attribute: .Left,
            relatedBy: .GreaterThanOrEqual,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 10).active = true
        
        NSLayoutConstraint(
            item: cityLabel,
            attribute: .Right,
            relatedBy: .GreaterThanOrEqual,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: -10).active = true
        
        NSLayoutConstraint(
            item: cityLabel,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: -25).active = true
        
        //cityListViewButton constraints
        NSLayoutConstraint(
            item: cityListViewButton,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: cityListViewButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: cityListViewButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        NSLayoutConstraint(
            item: cityListViewButton,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        // summaryLabel constraints
        NSLayoutConstraint(
            item: summaryLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 30).active = true
        
        NSLayoutConstraint(
            item: summaryLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 77).active = true
        
        // tempMinMaxLabel constraints
        NSLayoutConstraint(
            item: tempMinMaxLabel,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: iconImage,
            attribute: .Trailing,
            multiplier: 1, constant: 10).active = true
        
        NSLayoutConstraint(
            item: tempMinMaxLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 50).active = true
        
        // iconImage constraints
        NSLayoutConstraint(
            item: iconImage,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 25).active = true
        
        NSLayoutConstraint(
            item: iconImage,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 25).active = true
        
        NSLayoutConstraint(
            item: iconImage,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 55).active = true
        
        NSLayoutConstraint(
            item: iconImage,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 55).active = true
        
        // activityIndicatorView Constraints
        NSLayoutConstraint(
            item: activityIndicatorView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(
            item: activityIndicatorView,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1, constant: -100).active = true

    }
    
}




