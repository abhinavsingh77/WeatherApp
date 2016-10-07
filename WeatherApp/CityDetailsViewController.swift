//
//  CityDetailsViewController.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 06/10/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import UIKit

class CityDetailsViewController: WeatherAppViewController {
    
    let city:City
    let manager:NetworkManager
    
    @IBOutlet weak var theTableView: UITableView?
    
    init?(cityParam:City) {
        
        city = cityParam
        manager = NetworkManager()
        
        super.init(nibName: "CityDetailsViewController", bundle: nil)
        
        self.title = city.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let classNameString = "ForecastTableViewCell";
        theTableView?.registerNib(UINib.init(nibName:classNameString, bundle: nil), forCellReuseIdentifier:classNameString)
        theTableView?.rowHeight = UITableViewAutomaticDimension
        
        self.startLoading();
        
        manager.fetchNextFewDaysForecastForCity(self.city, block: {[weak self] (cityData, errorType) in
            
            if let error = errorType {
                
                self?.showError(error)
            }
            
            self?.theTableView?.reloadData()
            self?.endLoading()
        })
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 120
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.city.forecasts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ForecastTableViewCell")
        let forecast = self.city.forecasts[indexPath.row]
        
        guard let tCell = cell as? ForecastTableViewCell else {
            return cell!
        }
        
        tCell.showDetailsOfForecast(forecast)
        
        return cell!
    }
}
