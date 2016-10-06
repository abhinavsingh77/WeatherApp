//
//  Forecast.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 05/10/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import Foundation

class Forecast {
    
    let minTemp:Double
    let maxTemp:Double
    let pressure:Double
    let humidity:Double
    
    let date:NSDate
    
    init?(dataDict:[String:AnyObject], dateinterval:NSTimeInterval) {
        
        if (dateinterval > 0) {
            
            date = NSDate.init(timeIntervalSince1970:dateinterval);
            
            guard let miTemp = dataDict["temp_min"] as? Double,
                maTemp = dataDict["temp_max"] as? Double,
                pres = dataDict["pressure"] as? Double,
                hum = dataDict["humidity"] as? Double else {
                    
                    return nil;
            }
            
            minTemp = miTemp
            maxTemp = maTemp
            pressure = pres
            humidity = hum
        }else {
            
            return nil;
        }
    }
}

