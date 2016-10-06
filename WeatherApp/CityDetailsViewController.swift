//
//  CityDetailsViewController.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 06/10/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import UIKit

class CityDetailsViewController: WeatherAppViewController {
    
    var city:[City]? = nil
    let manager:NetworkManager
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        manager = NetworkManager()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        manager = NetworkManager()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
