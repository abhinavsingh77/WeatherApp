//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 21/09/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import UIKit
//{
//    "coord":{
//        "lon":-0.13,
//        "lat":51.51
//    },
//    "weather":[
//    {
//    "id":800,
//    "main":"Clear",
//    "description":"clear sky",
//    "icon":"01d"
//    }
//    ],
//    "base":"stations",
//    "main":{
//        "temp":286.847,
//        "pressure":1037.28,
//        "humidity":59,
//        "temp_min":286.847,
//        "temp_max":286.847,
//        "sea_level":1045,
//        "grnd_level":1037.28
//    },
//    "wind":{
//        "speed":6.5,
//        "deg":105.007
//    },
//    "clouds":{
//        "all":0
//    },
//    "dt":1475660232,
//    "sys":{
//        "message":0.1657,
//        "country":"GB",
//        "sunrise":1475647738,
//        "sunset":1475688449
//    },
//    "id":2643743,
//    "name":"London",
//    "cod":200
//}



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

