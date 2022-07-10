//
//  HourlyWeather.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 23.06.22.
//

import Foundation

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
    let pop: Double

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
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
enum Main: String, Codable {
        case rain = "Rain"
        case snow = "Snow"
        case thunderstorm = "Thunderstorm"
        case clouds = "Clouds"
        case clear = "Clear"
        case mist = "Mist"
        case smoke = "Smoke"
        case haze = "Haze"
        case dust = "Dust"
        case fog = "Fog"
        case sand = "Sand"
        case ash = "Ash"
        case squall = "Squall"
        case tornado = "Tornado"
    }







