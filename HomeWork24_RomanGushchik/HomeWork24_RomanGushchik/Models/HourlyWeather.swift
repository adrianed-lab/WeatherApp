//
//  HourlyWeather.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 23.06.22.
//

import Foundation

struct HourlyWeather: Codable {
    let latitude, longitude: Double
    let timezone: String
    let timezoneOffset: Int
    let hourly: [Hourly]

    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case timezone
        case timezoneOffset = "timezone_offset"
        case hourly
    }
}

struct Hourly: Codable {
    let dateTime: Int
    let temperature, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [WeatherForHours]
    let pop: Int

    enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, pop
    }
}

struct WeatherForHours: Codable {
    let id: Int
    let main: Main
    let weatherDescription: Description
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

