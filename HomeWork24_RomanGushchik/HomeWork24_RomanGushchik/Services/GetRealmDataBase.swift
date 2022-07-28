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
    func getDataBase(value: CurrentWeather, state: String)
    func getObject(nameObject: CurrentPlaceData.Type) -> Results<CurrentPlaceData>
}

class RealmDataBase: RealmDataBaseProtocol {
    let config = Realm.Configuration(schemaVersion: 2)
    

    func getObject(nameObject: CurrentPlaceData.Type) -> Results<CurrentPlaceData> {
        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
        let currentPlaceData = realm.objects(nameObject).sorted(byKeyPath: "dateTime", ascending: false)
        return currentPlaceData
    }
    
    func getDataBase(value: CurrentWeather, state: String) {
            guard let weather = value.current.weather.first?.weatherDescription else {return}
            let date = Date()
            Realm.Configuration.defaultConfiguration = config
            let realm = try! Realm()
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
                realmDataBase.requestFlag = state
                realm.add(realmDataBase)
                guard let url = realm.configuration.fileURL else {return}
                print(url)
            }
        }
    }
    
    

