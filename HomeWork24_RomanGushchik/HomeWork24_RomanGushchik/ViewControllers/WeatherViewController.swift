    //
    //  ViewController.swift
    //  HomeWork24_RomanGushchik
    //
    //  Created by admin on 20.06.22.
    //

    import UIKit
    import RealmSwift
    import UserNotifications

    class WeatherViewController: UIViewController {
        
        @IBOutlet var myTableView: UITableView!
        var models = [Daily]()
        var hourlyModels = [Hourly]()
        var currentWeather: Current!
        var currentLocation: [CityCoordinate]!
        private var apiProvider: RestAPIProviderProtocol!
        private var realmDataBase: RealmDataBaseProtocol!
        private var localNotification: NotificationProtocol!
        static let key = "WeatherViewController"
        
        override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather"
        apiProvider = AlamofireAPIProvider()
        realmDataBase = RealmDataBase()
        localNotification = UserNotification()
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
        apiProvider.getWeatherByCityCoordinate(latitude: city.latitude, longitude: city.longitude) { [weak self] result in
            guard let self = self else {return}
            switch result {
              case .success(let value):
                self.models.append(contentsOf: value.dailyWeather)
                self.currentWeather = value.current
                self.hourlyModels = value.hourlyWeather
                self.realmDataBase.getDataBase(value: value)
                self.localNotification.createLocalNotification(valueWeather: value.hourlyWeather)
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
            let tableHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width/2))
            tableHeader.layer.cornerRadius = 20
            tableHeader.backgroundColor = .white
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
