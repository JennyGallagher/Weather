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
    //    Fonts: ROBOTECH GP,  LoveloLineBold
    
    lazy var cityLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = self.fontColor
        label.font = UIFont(name: "Avenir-Black", size: 30.0)
        label.text = "Chicago, IL"
        label.textAlignment = NSTextAlignment.Center
        label.userInteractionEnabled = false
        return label
        }()
    
    lazy var cityListViewButton: UIButton! = {
        let image = UIImage(named: "List-icon")
        let button = UIButton()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setImage(image, forState: UIControlState.Normal)
        return button
        }()
    
    lazy var currentTimeLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = self.fontColor
        label.font = UIFont(name: "Futura-CondensedExtraBold", size: 30.0)
        label.text = "12:00 pm"
        label.textAlignment = NSTextAlignment.Center
        return label
        }()
    
    
    lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = self.fontColor
        label.font = UIFont(name: "Avenir-Black", size: 130.0)
        label.text = "100°"
        label.textAlignment = NSTextAlignment.Center
        return label
        }()
    
    
    lazy var tempMinMaxLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = self.fontColor
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "50°"
        label.textAlignment = NSTextAlignment.Left
        return label
        }()
    
    
    lazy var summaryLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = self.fontColor
        label.font = UIFont(name: "Avenir-Black", size: 25.0)
        label.text = "Partly Cloudy"
        label.textAlignment = NSTextAlignment.Left
        return label
        }()
    
    
    lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .ScaleAspectFit
        icon.setTranslatesAutoresizingMaskIntoConstraints(false)
        return icon
        }()
    
    
    
    
    override init(topColor: UIColor, bottomColor: UIColor) {
        
        super.init(topColor: topColor, bottomColor: bottomColor)
        addSubview(cityLabel)
        addSubview(tempLabel)
        addSubview(tempMinMaxLabel)
        addSubview(iconImage)
        addSubview(summaryLabel)
        addSubview(cityListViewButton)
        configureConstraints()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configureConstraints(){
        let tempLabelXConstraint: () = NSLayoutConstraint(
            item: self.tempLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        let tempLabelYConstraint: () = NSLayoutConstraint(
            item: self.tempLabel,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1, constant: 0).active = true
        
        let cityLabelXConstraint: () = NSLayoutConstraint(
            item: self.cityLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        let cityLabelYConstraint: () = NSLayoutConstraint(
            item: self.cityLabel,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: -30).active = true
        
        
        let cityListViewButtonXConstraint: () = NSLayoutConstraint(
            item: self.cityListViewButton,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: -30).active = true
        
        let cityListViewButtonYConstraint: () = NSLayoutConstraint(
            item: self.cityListViewButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 30).active = true
        
        
        let cityListViewButtonWidthConstraint: () = NSLayoutConstraint(
            item: self.cityListViewButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 25).active = true
        
        
        
        let cityListViewButtonHeightConstraint: () = NSLayoutConstraint(
            item: self.cityListViewButton,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 25).active = true
        
        
        let summaryLabelXConstraint: () = NSLayoutConstraint(
            item: self.summaryLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 30).active = true
        
        let summaryLabelYConstraint: () = NSLayoutConstraint(
            item: self.summaryLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 60).active = true
        
        let tempMinMaxLabelXConstraint: () = NSLayoutConstraint(
            item: self.tempMinMaxLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 80).active = true
        
        let tempMinMaxLabelYConstraint: () = NSLayoutConstraint(
            item: self.tempMinMaxLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 25).active = true
        
        let iconImageXContraints: () = NSLayoutConstraint(
            item: self.iconImage,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 30).active = true
        
        let iconImageYContraints: () = NSLayoutConstraint(
            item: self.iconImage,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 30).active = true
        
        
        let iconImageWidthConstraints: () = NSLayoutConstraint(
            item: self.iconImage,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 40).active = true
        
        let iconImageHeightConstraints: () = NSLayoutConstraint(
            item: self.iconImage,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 30).active = true
        
    }
    
}


