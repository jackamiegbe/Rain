//
//  Location.swift
//  Rain
//
//  Created by MACBOOK on 14/04/2017.
//  Copyright © 2017 jack_amiegbe. All rights reserved.
//

import CoreLocation

//this is a singleton using static var which can be used throughout our app
class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
