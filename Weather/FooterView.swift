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
        let button =  UIButton(frame: CGRectMake(0, 0, 50, 50))
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTitle("+", forState: .Normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.customColor(), forState: UIControlState.Normal)
       
        button.titleLabel?.font  = UIFont(name: "Avenir-Heavy", size: 30)
        return button
        }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(addLocationButton)
        configureConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints(){
        let addLocationButtonXConstraint: () = NSLayoutConstraint(
            item: self.addLocationButton,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1, constant: 0).active = true
        
        let addLocationButtonYConstraint: () = NSLayoutConstraint(
            item: self.addLocationButton,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1, constant: 0).active = true
    }
    
}
