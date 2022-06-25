//
//  APIProviders.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 25.06.22.
//

import Foundation
import Alamofire
import UIKit

protocol RestAPIProviderProtocol {
    func getWeatherByCityCoordinate(latitude: Double, longitude: Double, completion: @escaping (Result<CurrentWeather, Error>) -> Void)
    func getCoordinateByCityName(cityName: String, completion: @escaping (Result<[GetCityCoordinate], Error>) -> Void)
}

class AlamofireAPIProvider: RestAPIProviderProtocol {
    func getWeatherByCityCoordinate(latitude: Double, longitude: Double, completion: @escaping (Result<CurrentWeather, Error>) -> Void) {
        let parametrs = addParametrs(queryItems: ["lat": latitude.description, "lon": longitude.description, "exclude": "minutely, alerts"])
        AF.request(Constants.weatherURL, method: .get, parameters: parametrs).responseDecodable(of: CurrentWeather.self) {
            response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getCoordinateByCityName(cityName: String, completion: @escaping (Result<[GetCityCoordinate], Error>) -> Void) {
        let parametrs = addParametrs(queryItems: ["q": cityName])
        AF.request(Constants.getCodingURL, method: .get, parameters: parametrs).responseDecodable(of: [GetCityCoordinate].self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func addParametrs(queryItems: [String: String]) -> [String: String] {
        var parametrs: [String: String] = [:]
        parametrs = queryItems
        if let valueAPIKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
        parametrs["appid"] = valueAPIKey
        }
        return parametrs
    }
}

