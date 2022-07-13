//
//  GetRealmDataBase.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 4.07.22.
//

import Foundation
import RealmSwift
import UIKit

protocol RealmDataBaseProtocol {
    func getDataBase(value: CurrentWeather)
    func getObject(nameObject: CurrentPlaceData.Type) -> Results<CurrentPlaceData>
}

class RealmDataBase: RealmDataBaseProtocol {
    let realm = try! Realm()
    
    func getObject(nameObject: CurrentPlaceData.Type) -> Results<CurrentPlaceData> {
        let currentPlaceData = realm.objects(nameObject).sorted(byKeyPath: "dateTime", ascending: false)
        return currentPlaceData
    }
    
    func getDataBase(value: CurrentWeather) {
            guard let weather = value.current.weather.first?.weatherDescription else {return}
            let date = Date()
            try! realm.write {
                let realmCurrentWeatherDataBase = CurrentWeatherData()
                realmCurrentWeatherDataBase.temp = value.current.temperature
                realmCurrentWeatherDataBase.feelsLike = value.current.feelsLike
                realmCurrentWeatherDataBase.weatherDiscription = weather
                realmCurrentWeatherDataBase.dateTime = Int(date.timeIntervalSince1970)
                realm.add(realmCurrentWeatherDataBase)
                let realmDataBase = CurrentPlaceData()
                realmDataBase.lat = value.latitude
                realmDataBase.lon = value.longitude
                realmDataBase.dateTime = Int(date.timeIntervalSince1970)
                realmDataBase.currentWeather = realmCurrentWeatherDataBase
                realm.add(realmDataBase)
                guard let url = realm.configuration.fileURL else {return}
                print(url)
            }
        }
    }
    
    

