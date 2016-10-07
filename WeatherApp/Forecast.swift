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
    
    init?(dataDict:[String:AnyObject]) {
        
        guard let dateinterval = dataDict["dt"] as? Double,
            pres = dataDict["pressure"] as? Double,
            hum = dataDict["humidity"] as? Double,
        tempDict = dataDict["temp"] as? [String:AnyObject] else {
                
                return nil
        }
        
        guard let miTemp = tempDict["min"] as? Double,
            maTemp = tempDict["max"] as? Double else {
                
                return nil
        }
        
        minTemp = miTemp
        maxTemp = maTemp
        date = NSDate.init(timeIntervalSince1970:dateinterval);
        pressure = pres
        humidity = hum
    }
}

