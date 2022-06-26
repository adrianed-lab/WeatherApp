//
//  GetCityCoordinates.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 23.06.22.
//

import Foundation

struct CityCoordinate: Codable {
    let cityName: String
    let latitude, longitude: Double
    let country: String

    enum CodingKeys: String, CodingKey {
        case cityName = "name"
        case country
        case latitude = "lat"
        case longitude = "lon"
    }
}


