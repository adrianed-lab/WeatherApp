//
//  Weather.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 20.06.22.
//

import Foundation
import UIKit

struct CurrentWeather: Codable {
    let latitude, longitude: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let hourlyWeather: [Hourly]
    let dailyWeather: [Daily]

    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case timezone
        case timezoneOffset = "timezone_offset"
        case current
        case hourlyWeather = "hourly"
        case dailyWeather = "daily"
    }
}

struct Current: Codable {
    let dateTime, sunrise, sunset: Int
    let temperature, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double!
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case sunrise, sunset
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather
    }
}

struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}


