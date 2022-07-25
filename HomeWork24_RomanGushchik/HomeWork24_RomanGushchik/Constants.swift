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
