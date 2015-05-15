//
//  BlurEffect.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/8/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

class BlurView {
    
    class func addBlurView(view: UIView, style: UIBlurEffectStyle){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        var vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        blurEffectView.frame = view.bounds
        view.insertSubview(blurEffectView, atIndex: 0)
    }
    

    
}

