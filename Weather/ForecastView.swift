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
        label.text = "- -"
        label.textAlignment = .Center
        label.userInteractionEnabled = false
        label.lineBreakMode = .ByWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    lazy var cityListViewButton: UIButton! = {
        let image = UIImage(named: "List Filled-64")
        let button = UIButton()
        button.imageEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setImage(image, forState: .Normal)
        return button
        }()
    
    
    lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = self.fontColor
        label.font = UIFont(name: "Avenir-Black", size: 130.0)
        label.text = "- -"
        label.textAlignment = .Center
        return label
        }()
    
    
    lazy var tempMinMaxLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = self.fontColor
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.textAlignment = .Left
        return label
        }()
    
    
    lazy var summaryLabel: UILabel! = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = self.fontColor
        label.font = UIFont(name: "Avenir-Black", size: 25.0)
        label.text = "- -"
        label.textAlignment = .Left
        return label
        }()
    
    
    lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .ScaleAspectFit
        icon.alpha = 0.85
        icon.setTranslatesAutoresizingMaskIntoConstraints(false)
        return icon
        }()
    
    lazy var activityIndicatorView : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.activityIndicatorViewStyle = .WhiteLarge
        view.alpha = 0.85
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
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
        let tempLabelXConstraint: () = NSLayoutConstraint(
            item: tempLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        let tempLabelYConstraint: () = NSLayoutConstraint(
            item: tempLabel,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1, constant: 0).active = true
        
        let cityLabelXConstraint: () = NSLayoutConstraint(
            item: cityLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        let cityLabelLeftConstraint: () = NSLayoutConstraint(
            item: cityLabel,
            attribute: .Left,
            relatedBy: .GreaterThanOrEqual,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 10).active = true
        
        let cityLabelRightConstraint: () = NSLayoutConstraint(
            item: cityLabel,
            attribute: .Right,
            relatedBy: .GreaterThanOrEqual,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: -10).active = true
        
        let cityLabelYConstraint: () = NSLayoutConstraint(
            item: cityLabel,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: -30).active = true
        
        
        let cityListViewButtonXConstraint: () = NSLayoutConstraint(
            item: cityListViewButton,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1, constant: 0).active = true
        
        let cityListViewButtonYConstraint: () = NSLayoutConstraint(
            item: cityListViewButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 0).active = true
        
        
        let cityListViewButtonWidthConstraint: () = NSLayoutConstraint(
            item: cityListViewButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        
        
        let cityListViewButtonHeightConstraint: () = NSLayoutConstraint(
            item: cityListViewButton,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 100).active = true
        
        
        let summaryLabelXConstraint: () = NSLayoutConstraint(
            item: summaryLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 30).active = true
        
        let summaryLabelYConstraint: () = NSLayoutConstraint(
            item: summaryLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 90).active = true
        
        let tempMinMaxLabelXConstraint: () = NSLayoutConstraint(
            item: tempMinMaxLabel,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: iconImage,
            attribute: .Trailing,
            multiplier: 1, constant: 5).active = true
        
        let tempMinMaxLabelYConstraint: () = NSLayoutConstraint(
            item: tempMinMaxLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 60).active = true
        
        let iconImageXContraints: () = NSLayoutConstraint(
            item: iconImage,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1, constant: 30).active = true
        
        let iconImageYContraints: () = NSLayoutConstraint(
            item: iconImage,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1, constant: 25).active = true
        
        let iconImageWidthConstraints: () = NSLayoutConstraint(
            item: iconImage,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 65).active = true
        
        let iconImageHeightConstraints: () = NSLayoutConstraint(
            item: iconImage,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1, constant: 65).active = true
        
        let activityIndicatorViewXConstraints: () = NSLayoutConstraint(
            item: activityIndicatorView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        let activityIndicatorViewYConstraints: () = NSLayoutConstraint(
            item: activityIndicatorView,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1, constant: -100).active = true


    }
    
}




