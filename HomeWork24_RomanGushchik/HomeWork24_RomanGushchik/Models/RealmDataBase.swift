//
//  RealDataBase.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 3.07.22.
//

import Foundation
import RealmSwift

class RealmDataBase: Object {
    @objc dynamic var lat: Double = 0
    @objc dynamic var lon: Double = 0
    @objc dynamic var time: Int = 0
    @objc dynamic var currentWeather: RealmCurrentWeatherDataBase!
}

class RealmCurrentWeatherDataBase: Object {
    @objc dynamic var temp: Double = 0
    @objc dynamic var feelsLike: Double = 0
    @objc dynamic var weatherDiscription: String = ""
    @objc dynamic var time: Int = 0
}