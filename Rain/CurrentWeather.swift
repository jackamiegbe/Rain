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
    
    //we need to have a func that will download data and set values to work the way thier supposed to
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Download Current Weather Data
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            
            let result = response.result
            
            //we are ready from a dictioanry we aren't certain of values so us as? Dictionary<String, AnyObject>
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                //if you look at the json file you see "name" is in 1st layer dictionary
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    //the reason we are using self.value is becasue we are within closures
                    print(self._cityName)
                }
                //however with weather its within a dictionary in a dictionary so as? [Dictionary<String, AnyObject>]
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    //6:45
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        self._currentTemp = kelvinToFarenheit
                        print(self._currentTemp)
                    }
                }
                completed()
            }
        }
    }
}




