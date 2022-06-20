//
//  ViewController.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 20.06.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Minsk&appid=2fbe78d61a988be7934bebfe2d3468ce") {
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




