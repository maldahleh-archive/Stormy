//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Mohammed Al-Dahleh on 2017-12-09.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init(from model: CurrentWeather) {
        temperature = "\(model.temperature.percent().int())º"
        
        let humidityValue = model.humidity.percent().int()
        humidity = "\(humidityValue)%"
        
        let precipValue = model.precipitationProbability.percent().int()
        precipitationProbability = "\(precipValue)%"
        
        summary = model.summary
        
        let weatherIcon = WeatherIcon(iconString: model.icon)
        icon = weatherIcon.image
    }
}

extension Double {
    func percent() -> Double {
        return self * 100
    }
    
    func int() -> Int {
        return Int(self)
    }
}
