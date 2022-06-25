//
//  DailyWeather.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 23.06.22.
//

import Foundation

struct DailyWeather: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case daily
    }
}

struct Daily: Codable {
    let dateTime, sunrise, sunset, moonrise: Int
    let moonset: Int
    let moonPhase: Double
    let temperature: Temperature
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [WeatherOfDaily]
    let clouds: Int
    let pop, uvi: Double
    let rain: Double?

    enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi, rain
    }
}

struct FeelsLike: Codable {
    let day, night, evening, morning: Double
    
    enum CodingKeys: String, CodingKey {
        case evening = "eve"
        case morning = "morn"
        case day, night
    }
}

struct Temperature: Codable {
    let day, min, max, night: Double
    let evening, morning: Double
    
    enum CodingKeys: String, CodingKey {
        case evening = "eve"
        case morning = "morn"
        case day, night, min, max
    }
}

struct WeatherOfDaily: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
