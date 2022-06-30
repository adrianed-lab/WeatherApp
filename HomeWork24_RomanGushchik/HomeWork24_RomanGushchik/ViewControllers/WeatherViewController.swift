    //
    //  ViewController.swift
    //  HomeWork24_RomanGushchik
    //
    //  Created by admin on 20.06.22.
    //

    import UIKit

    class WeatherViewController: UIViewController {
        
        @IBOutlet var myTableView: UITableView!
        var models = [Daily]()
        var hourlyModels = [Hourly]()
        var currentWeather: Current!
        var currentLocation: [CityCoordinate]!
        private var apiProvider: RestAPIProviderProtocol!
        static let key = "WeatherViewController"
        
        override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather"
        apiProvider = AlamofireAPIProvider()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "HourlyTableViewCell", bundle: nil), forCellReuseIdentifier: HourlyTableViewCell.key)
        myTableView.register(UINib(nibName: "DailyTableViewCell", bundle: nil), forCellReuseIdentifier: DailyTableViewCell.key)
            getCoordinateByCityName()
            
           
        }
    fileprivate func getCoordinateByCityName() {
            apiProvider.getCoordinateByCityName(cityName: "Minsk") { result in
            switch result {
                case .success(let value):
                self.currentLocation = value
                if let city = value.first {
                    self.getWeatherByCoordinate(city: city)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    private func getWeatherByCoordinate(city: CityCoordinate) {
        apiProvider.getWeatherByCityCoordinate(latitude: city.latitude, longitude: city.longitude) { result in
            switch result {
              case .success(let value):
                self.models.append(contentsOf: value.dailyWeather)
                self.hourlyModels = value.hourlyWeather
                //let current = value.current
                self.currentWeather = value.current
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                    self.myTableView.tableHeaderView = self.createTableHeader()
                }
             
              case .failure(let error):
                        print(error)
                }
        }
    }
        func createTableHeader() -> UIView {
            let tableHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
            tableHeader.backgroundColor = .red
            let currentLocationLabel = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.size.width, height: tableHeader.frame.size.height/5))
            let tempLabel = UILabel(frame: CGRect(x: 10, y: 20 + currentLocationLabel.frame.size.height, width: view.frame.size.width, height: tableHeader.frame.size.height/2))
            let weatherDiscription = UILabel(frame: CGRect(x: 10, y: 20 + currentLocationLabel.frame.size.height + tempLabel.frame.size.height, width: view.frame.size.width, height: tableHeader.frame.size.height/5))
            currentLocationLabel.textAlignment = .center
            tempLabel.textAlignment = .center
            weatherDiscription.textAlignment = .center
            tempLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
            tableHeader.addSubview(currentLocationLabel)
            tableHeader.addSubview(tempLabel)
            tableHeader.addSubview(weatherDiscription)
            
            tempLabel.text = "\(currentWeather.temperature)°"
            guard let weather = currentWeather.weather.first?.weatherDescription, let cityName = currentLocation.first?.cityName else {
                return UIView()
            }
            weatherDiscription.text = "\(weather)"
            currentLocationLabel.text = cityName
            
            return tableHeader
        }
        
        
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
         return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.key, for: indexPath) as! HourlyTableViewCell
            cell.configure(with: hourlyModels)
            return cell
        }
    
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.key, for: indexPath) as! DailyTableViewCell
            cell.configure(model: models[indexPath.row])
            return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
        
    }
    
    
}



