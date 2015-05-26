//
//  GradientView.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/9/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    private var topColor : UIColor = UIColor.whiteColor()
    private var bottomColor : UIColor = UIColor.blackColor()
    private var background : CAGradientLayer
    
    
    init(topColor: UIColor, bottomColor : UIColor){
        
        self.topColor = topColor
        self.bottomColor = bottomColor
        
        self.background = CAGradientLayer.gradientLayerWithTopColor(topColor, bottomColor: bottomColor)
        super.init(frame: CGRectZero)
        self.layer.insertSublayer(background, atIndex: 0)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gradientAnimation", name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        background.frame = self.bounds
        gradientAnimation()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    func gradientAnimation(){
        let locations = []
        
        background.locations = locations as [AnyObject]
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.05, 0.7]
        gradientAnimation.byValue = [0.4, 0.8]
        gradientAnimation.duration = 6.0
        gradientAnimation.repeatCount = .infinity
        gradientAnimation.autoreverses = true
        
        gradientAnimation.timingFunction = CAMediaTimingFunction(name: "easeInEaseOut")
        
        background.addAnimation(gradientAnimation, forKey: nil)
        
    }
}

