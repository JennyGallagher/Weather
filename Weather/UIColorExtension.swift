//
//  UIColorExtension.swift
//  Weather
//
//  Created by Jenny Gallagher on 4/9/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

extension UIColor {
    
    
    class func yellowToPinkColor() -> (topColor : UIColor, bottomColor : UIColor) {
        let topColor = UIColor(red: (255/255.0), green: (211/255.0), blue: (0/255.0), alpha: 1)
        let bottomColor = UIColor(red: (255/255.0), green: (0/255.0), blue: (119/255.0), alpha: 1)
        
        return (topColor, bottomColor)
    }
    
    class func miamiViceColors() -> (topColor : UIColor, bottomColor : UIColor) {
        let topColor = UIColor(red: (242/255.0), green: (145/255.0), blue: (216/255.0), alpha: 1)
        let bottomColor = UIColor(red: (39/255.0), green: (242/255.0), blue: (242/255.0), alpha: 1)
        
        return (topColor, bottomColor)
    }
    
    class func tealToPurple() -> (topColor : UIColor, bottomColor : UIColor) {
        let topColor = UIColor(red: (78/255.0), green: (250/255.0), blue: (213/255.0), alpha: 1)
        let bottomColor = UIColor(red: (158/255.0), green: (15/255.0), blue: (237/255.0), alpha: 1)
        
        return (topColor, bottomColor)
    }
    
    class func neonYellowToPink() -> (topColor : UIColor, bottomColor : UIColor) {
        let topColor = UIColor(red: (204/255.0), green: (253/255.0), blue: (102/255.0), alpha: 1)
        let bottomColor = UIColor(red: (242/255.0), green: (5/255.0), blue: (116/255.0), alpha: 1)
        
        return (topColor, bottomColor)
    }
    
    class func yellowToPinkColor2() -> (topColor : UIColor, bottomColor : UIColor) {
        let topColor = UIColor(red: (255/255.0), green: (191/255.0), blue: (64/255.0), alpha: 1)
        let bottomColor = UIColor(red: (255/255.0), green: (9/255.0), blue: (162/255.0), alpha: 1)
        
        return (topColor, bottomColor)
    }
    
    class func yellowToPurle() -> (topColor : UIColor, bottomColor : UIColor) {
        let topColor = UIColor(red: (254/255.0), green: (215/255.0), blue: (69/255.0), alpha: 1)
        let bottomColor = UIColor(red: (158/255.0), green: (15/255.0), blue: (237/255.0), alpha: 1)
        
        return (topColor, bottomColor)
    }
    
    class func pinkToPurle() -> (topColor : UIColor, bottomColor : UIColor) {
        let topColor = UIColor(red: (255/255.0), green: (9/255.0), blue: (162/255.0), alpha: 1)
        let bottomColor = UIColor(red: (158/255.0), green: (15/255.0), blue: (237/255.0), alpha: 1)
        
        return (topColor, bottomColor)
    }

    
    class func customColor() -> UIColor{
        return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.55)
    }
    
    
    class func fontColor() ->UIColor{
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
    }
    
    
}