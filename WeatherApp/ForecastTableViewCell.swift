//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Abhinav Singh on 06/10/16.
//  Copyright © 2016 Leftshift. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var minTempLabel: UILabel?
    @IBOutlet weak var maxTempLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    @IBOutlet weak var pressureLabel: UILabel?
    
    var displayedForecast:Forecast? = nil
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
    func showDetailsOfForecast(forecast:Forecast?, cityName:String?) {
        
        displayedForecast = forecast
        if (cityName != nil) {
            
            titleLabel?.text = cityName
        }else {
            titleLabel?.text = "Today"
        }
        
        guard let forCas = forecast else {
            
            displayedForecast = nil;
            
            minTempLabel?.text = "--"
            maxTempLabel?.text = "--"
            humidityLabel?.text = "--"
            pressureLabel?.text = "--"
            return
        }
        
        displayedForecast = forCas;
        
        minTempLabel?.text = "Minimum:\n\(forCas.minTemp)"
        maxTempLabel?.text = "Maximum:\n\(forCas.maxTemp)"
        humidityLabel?.text = "Humidity:\n\(forCas.humidity)"
        pressureLabel?.text = "Pressure:\n\(forCas.pressure)"
    }
}
