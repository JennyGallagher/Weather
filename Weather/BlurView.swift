//
//  BlurEffect.swift
//  Weather
//
//  Created by Jenny Gallagher on 5/8/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

class BlurView : UIVisualEffectView {
    
    init() {
        let blurEffect = UIBlurEffect(style: .Light)
//     This wasn't getting called 10/21   let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        super.init(effect: blurEffect)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

