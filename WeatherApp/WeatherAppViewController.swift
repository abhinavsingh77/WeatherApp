//
//  WeatherAppViewController.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 06/10/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import UIKit

enum WeatherAppValidationError : ErrorType {
    
    case WeatherAppValidationUnknown
    case WeatherAppValidationErrorEmptyString
    
    init() {
        self = WeatherAppValidationUnknown
    }
}


class WeatherAppViewController: UIViewController {
    
    weak var loadingView:UIView? = nil
    
    func startLoading(){
        
        if self.loadingView == nil{
            
            let loading = UIView.init(frame: CGRectZero)
            loading.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(loading)
            
            let indicator = UIActivityIndicatorView.init(activityIndicatorStyle: .WhiteLarge)
            indicator.color = UIColor.blackColor()
            indicator.translatesAutoresizingMaskIntoConstraints = false
            loading.addSubview(indicator)
            
            let layoutDict = ["loading" : loading, "indicator" : indicator]
            
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[loading]-0-|", options:NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: layoutDict))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[loading]-0-|", options:NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: layoutDict))
            
            loading.addConstraint(NSLayoutConstraint.init(item: indicator, attribute:.CenterX, relatedBy: .Equal, toItem: loading, attribute: .CenterX, multiplier: 1, constant: 0))
            loading.addConstraint(NSLayoutConstraint.init(item: indicator, attribute:.CenterY, relatedBy: .Equal, toItem: loading, attribute: .CenterY, multiplier: 1, constant: 0))
            
            indicator.startAnimating()
            self.loadingView = loading
        }
    }
    
    func endLoading() {
        
        self.loadingView?.removeFromSuperview()
        self.loadingView = nil
    }
    
    func showError(error:ErrorType){
        
        var message:String = "Somethig weird happen\nplease try again later!"
        var title:String = "Sorry!"
        
        switch error {
            case WeatherAppValidationError.WeatherAppValidationErrorEmptyString:
                
                title = "Sorry!"
                message = "Please enter a valid string."
            default:
                
                print("Un Handled error \(error)")
        }
        
        let controller = UIAlertController.init(title:title, message:message, preferredStyle:.Alert)
        let action = UIAlertAction.init(title: "Okay", style: .Cancel, handler: nil)
        controller.addAction(action)
        
        self.presentViewController(controller, animated:true, completion: nil)
    }
}
