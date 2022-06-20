//
//  ViewController.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 20.06.22.
//

import UIKit

class ViewController: UIViewController {
    var city: String!

    override func viewDidLoad() {
        super.viewDidLoad()
       getDataWeather("Minsk", "metric")
    }
    
    func getDataWeather(_ city: String, _ units: String) {
        if let valueAPIKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
               
               if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(valueAPIKey)&units=\(units)") {
                   var urlRequest = URLRequest(url: url)
                   // тип запроса
                   urlRequest.httpMethod = "GET"
                   // добавляем в заголовок тип контента
                   urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   // создаем таск для непосредственного запроса на сервер
                   let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
                       if let response = response {
                           print(response)
                       }
                       if let data = data {
                           let users = try! JSONDecoder().decode(WelcomeToWeather.self, from: data)
                           print(users)
                           print(data)
                      }
                       if let error = error {
                           print(error)
                       }
                   }
                   // запускаем запрос на выполнение
                   dataTask.resume()
               }
            }
        }
}




