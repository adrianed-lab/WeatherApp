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
    func getCoordinateByCityName(cityName: String, completion: @escaping (Result<[CityCoordinate], Error>) -> Void)
}

class AlamofireAPIProvider: RestAPIProviderProtocol {
    
    func getCoordinateByCityName(cityName: String, completion: @escaping (Result<[CityCoordinate], Error>) -> Void) {
        let parameters = addParametrs(queryItems: ["q": cityName])
            AF.request(Constants.getCodingURL, method: .get, parameters: parameters).responseDecodable(of: [CityCoordinate].self) { response in
                switch response.result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
                print(response.result)
            }
        }
    
    func getWeatherByCityCoordinate(latitude: Double, longitude: Double, completion: @escaping (Result<CurrentWeather, Error>) -> Void) {
        let parameters = addParametrs(queryItems: ["lat": latitude.description, "lon": longitude.description, "exclude": "minutely, alerts", "units":"metric", "lang":"Lang".localizable()])
        AF.request(Constants.weatherURL, method: .get, parameters: parameters).responseDecodable(of: CurrentWeather.self) {
            response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
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

