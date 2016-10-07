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
        
        titleLabel?.font = UIFont.boldSystemFontOfSize(15)
        
        minTempLabel?.font = UIFont.boldSystemFontOfSize(12)
        maxTempLabel?.font = UIFont.boldSystemFontOfSize(12)
        pressureLabel?.font = UIFont.boldSystemFontOfSize(12)
        humidityLabel?.font = UIFont.boldSystemFontOfSize(12)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
    func attributedString(title:String, subTitle:String) -> NSAttributedString {
        
        let complete = title + "\n" + subTitle
        let attributed = NSMutableAttributedString.init(string: complete, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(12), NSForegroundColorAttributeName:UIColor.init(white:0, alpha: 0.5)])
        
        attributed.addAttributes([NSForegroundColorAttributeName:UIColor.blackColor(), NSFontAttributeName:UIFont.boldSystemFontOfSize(12)], range:NSMakeRange(0, title.characters.count))
        
        return attributed
    }
    
    func showDetailsOfForecast(forecast:Forecast?, cityName:String?) {
        
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
        
        minTempLabel?.attributedText = attributedString("Minimum", subTitle: "\(forCas.minTemp)")
        maxTempLabel?.attributedText = attributedString("Maximum", subTitle: "\(forCas.maxTemp)")
        humidityLabel?.attributedText = attributedString("Humidity", subTitle: "\(forCas.humidity)")
        pressureLabel?.attributedText = attributedString("Pressure", subTitle: "\(forCas.pressure)")
    }
    
    func showDetailsOfForecast(forecast:Forecast) {
        
        displayedForecast = forecast
        
        titleLabel?.text = forecast.date.stringValue()
        
        minTempLabel?.attributedText = attributedString("Minimum", subTitle: "\(forecast.minTemp)")
        maxTempLabel?.attributedText = attributedString("Maximum", subTitle: "\(forecast.maxTemp)")
        humidityLabel?.attributedText = attributedString("Humidity", subTitle: "\(forecast.humidity)")
        pressureLabel?.attributedText = attributedString("Pressure", subTitle: "\(forecast.pressure)")
    }
}
