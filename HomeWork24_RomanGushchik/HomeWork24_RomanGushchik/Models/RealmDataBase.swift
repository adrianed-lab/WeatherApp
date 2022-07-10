//
//  RealDataBase.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 3.07.22.
//

import Foundation
import RealmSwift

class CurrentPlaceData: Object {
    @objc dynamic var lat: Double = 0
    @objc dynamic var lon: Double = 0
    @objc dynamic var dateTime: Int = 0
    @objc dynamic var currentWeather: CurrentWeatherData!
}

class CurrentWeatherData: Object {
    @objc dynamic var temp: Double = 0
    @objc dynamic var feelsLike: Double = 0
    @objc dynamic var weatherDiscription: String = ""
    @objc dynamic var dateTime: Int = 0
}
