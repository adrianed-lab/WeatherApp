//
//  GetRealmDataBase.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 4.07.22.
//

import Foundation
import RealmSwift
import UIKit

protocol RealmDataBase {
    func getDataBase(value: CurrentWeather)
}

class CurrentRealmDataBase: RealmDataBase {
    func getDataBase(value: CurrentWeather) {
            guard let weather = value.current.weather.first?.weatherDescription else {return}
            let date = Date()
            let realm = try! Realm()
            try! realm.write {
                let realmCurrentWeatherDataBase = RealmCurrentWeatherDataBase()
                realmCurrentWeatherDataBase.temp = value.current.temperature
                realmCurrentWeatherDataBase.feelsLike = value.current.feelsLike
                realmCurrentWeatherDataBase.weatherDiscription = weather
                realmCurrentWeatherDataBase.time = Int(date.timeIntervalSince1970)
                realm.add(realmCurrentWeatherDataBase)
                let realmDataBase = RealmDataBase()
                realmDataBase.lat = value.latitude
                realmDataBase.lon = value.longitude
                realmDataBase.time = Int(date.timeIntervalSince1970)
                realmDataBase.currentWeather = realmCurrentWeatherDataBase
                realm.add(realmDataBase)
                print(realm.configuration.fileURL)
        
            }
        }
    }
    
    

