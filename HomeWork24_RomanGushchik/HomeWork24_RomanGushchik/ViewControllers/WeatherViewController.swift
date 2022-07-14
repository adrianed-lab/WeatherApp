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
        @IBOutlet weak var imageWeatherView: UIImageView!
        var dailyWeather = [Daily]()
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
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        
        apiProvider = AlamofireAPIProvider()
        realmDataBase = RealmDataBase()
        localNotification = UserNotification()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "HourlyTableViewCell", bundle: nil), forCellReuseIdentifier: HourlyTableViewCell.key)
        myTableView.register(UINib(nibName: "DailyTableViewCell", bundle: nil), forCellReuseIdentifier: DailyTableViewCell.key)
        myTableView.backgroundColor = .clear
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
                self.dailyWeather.append(contentsOf: value.dailyWeather)
                self.currentWeather = value.current
                self.hourlyModels = value.hourlyWeather
                self.realmDataBase.getDataBase(value: value)
                self.localNotification.createLocalNotification(valueWeather: value.hourlyWeather)
                guard let mainWeather = value.hourlyWeather.first?.weather.first?.main.rawValue else {return}
                let backgroundImage = self.getImageForBackground(mainWeather: mainWeather)
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                    self.myTableView.tableHeaderView = self.createTableHeader()
                    self.imageWeatherView.contentMode = .scaleAspectFill
                    self.imageWeatherView.image = backgroundImage
                }
              case .failure(let error):
                    print(error)
                }
        }
    }
        func getImageForBackground(mainWeather: String) -> UIImage {
            guard let image = UIImage(named: mainWeather) else {return UIImage()}
            return image
       }
        
        func createTableHeader() -> UIView {
            let tableHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width/2 - 10))
            tableHeader.backgroundColor = .clear
            let currentLocationLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
            let tempLabel = UILabel(frame: CGRect(x: 0, y: currentLocationLabel.frame.size.height, width: view.frame.size.width, height: 40))
            let weatherDiscription = UILabel(frame: CGRect(x: 0, y: currentLocationLabel.frame.size.height + tempLabel.frame.size.height, width: view.frame.size.width, height: 30))
            let hightAndLowTemp = UILabel(frame: CGRect(x: 0, y: currentLocationLabel.frame.size.height + tempLabel.frame.size.height + weatherDiscription.frame.size.height, width: view.frame.size.width, height: 30))
            hightAndLowTemp.textAlignment = .center
            hightAndLowTemp.textColor = .white
            hightAndLowTemp.font = UIFont(name: "Thonburi-Light", size: 20)
            currentLocationLabel.textAlignment = .center
            currentLocationLabel.textColor = .white
            currentLocationLabel.font = UIFont(name: "Thonburi-Light", size: 32)
            tempLabel.textAlignment = .center
            tempLabel.textColor = .white
            tempLabel.font = UIFont(name: "Thonburi", size: 32)
            weatherDiscription.textAlignment = .center
            weatherDiscription.textColor = .white
            weatherDiscription.font = UIFont(name: "Thonburi-Light", size: 24)
            tableHeader.addSubview(currentLocationLabel)
            tableHeader.addSubview(tempLabel)
            tableHeader.addSubview(weatherDiscription)
            tableHeader.addSubview(hightAndLowTemp)
            tempLabel.text = "\(Int(currentWeather.temperature))°"
            guard let maxTemp = dailyWeather.first?.temperature.max , let minTemp = dailyWeather.first?.temperature.min else {return UIView()}
            hightAndLowTemp.text = "H:\(Int(maxTemp))° L:\(Int(minTemp))°"
            guard let weather = currentWeather.weather.first?.weatherDescription, let cityName = currentLocation.first?.cityName else {
                return UIView()
            }
            weatherDiscription.text = weather.capitalized
            currentLocationLabel.text = cityName
            
            return tableHeader
        }
}
