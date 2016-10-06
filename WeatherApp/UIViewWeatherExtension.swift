//
//  UIViewWeatherExtension.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 06/10/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func initWithDefaultXIB() ->  UIView? {
        
        guard let allObjs = NSBundle.mainBundle().loadNibNamed(NSStringFromClass(self), owner: nil, options: nil) as? [UIView] else {
            return nil
        }
        
        var retView:UIView? = nil
        
        for view in allObjs{
            
            if view.isKindOfClass(self) {
                
                retView = view
                break
            }
        }
        
        return retView;
    }
}