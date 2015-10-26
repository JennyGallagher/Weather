//
//  ColorExtension.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/9/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit



extension CAGradientLayer {
    
    class func gradientLayerWithTopColor(topColor : UIColor, bottomColor : UIColor) -> CAGradientLayer {
        
        let gradientColors: Array <AnyObject> = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: Array <NSNumber> = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
        
    }
}

