//
//  Weather.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 20.06.22.
//

import Foundation
import UIKit

struct WelcomeToWeather: Codable {
    let coordinates: Coordinates
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dateTime: Int
    let system: System
    let timeZone, id: Int
    let name: String
    let cod: Int
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case dateTime = "dt"
        case timeZone = "timezone"
        case system = "sys"
        case weather, base, main, visibility, wind, clouds, id, name, cod
    }
}

struct Clouds: Codable {
    let all: Int
}


struct Coordinates: Codable {
    let longitude, latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}

struct Main: Codable {
    let temperature, feelsLike, temperatureMin, temperatureMax: Double
    let pressure, humidity, seaLevel, groundLevel: Int

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
    }
}

struct System: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
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
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

