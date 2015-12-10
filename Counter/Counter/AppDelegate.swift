//
//  AppDelegate.swift
//  Counter
//
//  Created by Justin.Dombecki on 11/22/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationWillEnterForeground(application: UIApplication) {
        application.idleTimerDisabled = true
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        application.idleTimerDisabled = true
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        application.idleTimerDisabled = true
        return true
    }

    
    func applicationWillResignActive(application: UIApplication) {
        application.idleTimerDisabled = false
    }

    func applicationDidEnterBackground(application: UIApplication) {
        application.idleTimerDisabled = false
    }

    func applicationWillTerminate(application: UIApplication) {
        application.idleTimerDisabled = false
    }


}

