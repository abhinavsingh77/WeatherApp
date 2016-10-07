//
//  NSDateWeatherExtension.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 07/10/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import Foundation

struct DefaultFormatter {
    
    static var onceToken:dispatch_once_t = 0
    static var formatter:NSDateFormatter = NSDateFormatter.init()
}

extension NSDate {

    private func DefaultFormatterMethod() ->NSDateFormatter {
        
        dispatch_once(&DefaultFormatter.onceToken) {
            
            let formatt = NSDateFormatter()
            formatt.dateFormat = "dd MMM";
            DefaultFormatter.formatter = formatt;
        }
        
        return DefaultFormatter.formatter
    }
    
    func stringValue() -> String{
        
        return DefaultFormatterMethod().stringFromDate(self)
    }
}