//
//  AppDelegate.swift
//  Weather
//
//  Created by Jenny Gallagher on 3/20/15.
//  Copyright (c) 2015 Jenny Gallagher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        application.setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let navigationController = UINavigationController(rootViewController: ForecastViewController())
        navigationController.setNavigationBarHidden(true, animated: false)
        
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        return true
    }
    

}