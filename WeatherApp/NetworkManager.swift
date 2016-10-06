//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 27/09/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import Foundation

enum WeatherAppError : ErrorType {
    
    case WeatherAppErrorUnknown
    case WeatherAppErrorInvalidUrl //When error occurs during URL generation
    case WeatherAppErrorNetworkError //if we don't receive any data from server
    case WeatherAppErrorInvalidData //if we receive a valid NSData from server but its not a Dictionary
    case WeatherAppErrorInvalidStatusCode //Response dictionary status Code is not equal to 200
    case WeatherAppErrorInitilizatoinFailed
    
    init() {
        self = WeatherAppErrorUnknown
    }
}

let ApiKey = "9a204f6a2e6eaf4add840c89f0a7213f";

typealias DataFetchCompletionBlock = ([String:AnyObject]?, ErrorType?) -> Void
typealias ForecastFetchCompletionBlock = (City?, ErrorType?) -> Void

class NetworkManager {
    
    func fetchDataForUrl(requestUrl:NSURL, block:DataFetchCompletionBlock) -> Void {
        
        let request = NSURLRequest.init(URL:requestUrl ,cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 60)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, objError) in
            
            dispatch_async(dispatch_get_main_queue(), { 
                guard let ddata = data else {
                    
                    block(nil, WeatherAppError.WeatherAppErrorNetworkError);
                    return;
                }
                
                do {
                    
                    let someObj = try NSJSONSerialization.JSONObjectWithData(ddata, options:.AllowFragments)
                    guard let someDict = someObj as? [String:AnyObject] else {
                        
                        block(nil, WeatherAppError.WeatherAppErrorInvalidData);
                        return
                    }
                    
                    guard let scode = someDict["cod"] as? Int where scode == 200 else {
                        
                        block(nil, WeatherAppError.WeatherAppErrorInvalidStatusCode);
                        return
                    }
                    
                    block(someDict, nil);
                }catch {
                    
                    block(nil, error);
                }
            })
        })
        
        task.resume()
    }
    
    func fetchCityWeatherOfName(cityName:String, block:ForecastFetchCompletionBlock) -> Void {
        
        if let url = NSURL.init(string:("http://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid="+ApiKey)) {
            
            [self .fetchDataForUrl(url, block: { (dataDict, errorType) in
                
                if(errorType != nil) {
                    
                    block(nil, errorType);
                }else {
                    
                    guard let dataObject = dataDict else {
                        block(nil, WeatherAppError.WeatherAppErrorInvalidData);
                        return;
                    }
                    guard let city = City(dict:dataObject) else {
                        block(nil, WeatherAppError.WeatherAppErrorInitilizatoinFailed);
                        return;
                    }
                    block(city, nil);
                }
            })]
        }else {
            block(nil, WeatherAppError.WeatherAppErrorInvalidUrl);
        }
    }
    
    func fetchNextFewDaysForecastForCity(city:City, block:ForecastFetchCompletionBlock) -> Void {
        
        if let url = NSURL.init(string:("http://api.openweathermap.org/data/2.5/forecast/daily?id=\(city.cityId)" + "&appid="+ApiKey)) {
            
            [self .fetchDataForUrl(url, block: { (dataDict, errorType) in
                
                if(errorType != nil) {
                    
                    block(nil, errorType);
                }else {
                    
                    guard let dataObject = dataDict else {
                        block(nil, WeatherAppError.WeatherAppErrorInvalidData);
                        return;
                    }
                    guard let city = City(dict:dataObject) else {
                        block(nil, WeatherAppError.WeatherAppErrorInitilizatoinFailed);
                        return;
                    }
                    block(city, nil);
                }
            })]
        }else {
            block(nil, WeatherAppError.WeatherAppErrorInvalidUrl);
        }
    }
}