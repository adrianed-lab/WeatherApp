//
//  Constants.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 25.06.22.
//

import Foundation

struct Constants {
    
    static var keyState = "StateApp"
    
    static var buttonState = "ButtonState"

    static var baseURL = "https://api.openweathermap.org/"
    
    static var baseURLForWeatherImage = "https://openweathermap.org/img/wn/"
    
    static var getCodingURL: String {
        return baseURL.appending("geo/1.0/direct")
    }
    
    static var weatherURL: String {
        return baseURL.appending("data/2.5/onecall")
    }
     static var weatherImageIconURLPrefix: String {
        return "@2x.png"
    }

}

struct BadWeather: OptionSet {
    var rawValue: Int
    
    static let rain = BadWeather(rawValue: 1 << 0)
    static let snow = BadWeather(rawValue: 1 << 1)
    static let thunderstorm = BadWeather(rawValue: 1 << 2)
    static let clouds = BadWeather(rawValue: 1 << 3)
    static let clear = BadWeather(rawValue: 1 << 4)
    static let mist = BadWeather(rawValue: 1 << 5)
    static let smoke = BadWeather(rawValue: 1 << 6)
    static let haze = BadWeather(rawValue: 1 << 7)
    static let dust = BadWeather(rawValue: 1 << 8)
    static let fog = BadWeather(rawValue: 1 << 9)
    static let sand = BadWeather(rawValue: 1 << 10)
    static let ash = BadWeather(rawValue: 1 << 11)
    static let squall = BadWeather(rawValue: 1 << 12)
    static let tornado = BadWeather(rawValue: 1 << 13)
}

