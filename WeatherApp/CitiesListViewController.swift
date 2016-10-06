//
//  CitiesListViewController.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 27/09/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import UIKit

class CitiesListViewController: WeatherAppViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    var citiesList:[City] = []
    let manager:NetworkManager
    
    @IBOutlet weak var theTableView: UITableView?
    @IBOutlet weak var theSearchBar: UISearchBar?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        manager = NetworkManager()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        manager = NetworkManager()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        let classNameString = "ForecastTableViewCell";
        theTableView?.registerNib(UINib.init(nibName:classNameString, bundle: nil), forCellReuseIdentifier:classNameString)
        theTableView?.rowHeight = UITableViewAutomaticDimension
        
        self.title = "My Cities"
        
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.citiesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ForecastTableViewCell")
        let city = self.citiesList[indexPath.row]
        
        guard let tCell = cell as? ForecastTableViewCell else {
            return cell!
        }
        
        tCell.showDetailsOfForecast(city.forecasts.first, cityName: city.name)
        
        return cell!
    }
    
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        return true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        guard let textFinal = searchBar.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) where (textFinal.characters.count > 0) else {
            
            self.showError(WeatherAppValidationError.WeatherAppValidationErrorEmptyString)
            return
        }
        
        self.startLoading()
        manager.fetchCityWeatherOfName(textFinal, block: {[weak self] (city, errorType) in
            
            if let newCity = city {
                
                self?.citiesList.append(newCity)
                self?.theTableView?.reloadData()
            }
            else if let newErrorType = errorType {
                
                self?.showError(newErrorType)
            }
            else {
                
                self?.showError(WeatherAppValidationError())
            }
            
            self?.endLoading()
        })
        
        searchBar.text = nil;
        searchBar.resignFirstResponder()
    }
}

