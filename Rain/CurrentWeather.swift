//
//  CurrentWeather.swift
//  Rain
//
//  Created by MACBOOK on 14/04/2017.
//  Copyright © 2017 jack_amiegbe. All rights reserved.
//

import UIKit
import Alamofire

//we use data capsulation as best practice so we can limit who only this file accessing this info.
class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    
    //these if statements are so that the app doesn't crash if it doesnt return data
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        //create instance of date format desired
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
}




