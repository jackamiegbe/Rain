//
//  Constants.swift
//  Rain
//
//  Created by MACBOOK on 14/04/2017.
//  Copyright © 2017 jack_amiegbe. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "dd2101764d1f724ecedb6e5c34ac3790"

//this will tell our func when we are done downloading data 
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-33.87\(LONGITUDE)121.9\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/weather?lat=-33.87&lon=121.9&appid=dd2101764d1f724ecedb6e5c34ac3790"

