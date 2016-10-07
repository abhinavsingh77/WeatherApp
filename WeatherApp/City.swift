//
//  City.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 27/09/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import Foundation
import CoreLocation

class City {
    
    let name:String
    let cityId:Int
    let geoLocation:CLLocationCoordinate2D
    var forecasts:[Forecast] = []
    
    init?(dict:[String:AnyObject]){
        
        guard let coords = dict["coord"] as? [String:AnyObject] else {
            
            return nil;
        }
        
        guard let gname = dict["name"] as? String,
            cId = dict["id"] as? Int,
            latitude = coords["lat"] as? Double,
            longitude = coords["lon"] as? Double
            else {
                
            return nil;
        }
        
        geoLocation = CLLocationCoordinate2DMake(latitude, longitude)
        name = gname
        cityId = cId
        
        guard let mainTempDict = dict["main"] as? [String:AnyObject], dateInterval = dict["dt"] as? Double else {
            
            return;
        }
        
        guard let cast = Forecast(dataDict:mainTempDict, dateinterval:dateInterval) else {
            
            return;
        }
        
        forecasts.append(cast);
    }
    
    func addForecastsFromDictionary(dataDict:[String:AnyObject]) {
        
        if let forecastList = dataDict["list"] as? [[String:AnyObject]]{
            
            for item in forecastList {
                
                if let cast = Forecast(dataDict:item) {
                    
                    forecasts.append(cast);
                }
            }
        }
    }
}