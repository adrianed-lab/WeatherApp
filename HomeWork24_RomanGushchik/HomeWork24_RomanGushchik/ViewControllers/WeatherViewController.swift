    //
    //  ViewController.swift
    //  HomeWork24_RomanGushchik
    //
    //  Created by admin on 20.06.22.
    //

    import UIKit
    import RealmSwift
    import UserNotifications
    import CoreLocation
    import GoogleMaps

    class WeatherViewController: UIViewController {
        @IBOutlet var myTableView: UITableView!
        @IBOutlet weak var imageWeatherView: UIImageView!
        @IBOutlet weak var addCityButton: UIButton!
        @IBOutlet weak var currentLocationButton: UIButton!
        var dailyWeather = [Daily]()
        var hourlyModels = [Hourly]()
        var currentWeather: Current!
        var currentLocation: [CityCoordinate]!
        var arrayCurrentLocations = [CLLocation]()
        var cityName: UITextField!
        var isCurrentWeather: Bool!
        var editState: EditState = .currentLocationWeather {
            didSet {
                currentLocationButton.isSelected = editState == .currentLocationWeather
                addCityButton.isSelected = editState == .cityWeather
                
            }
        }
        private lazy var coreManager: CLLocationManager = {
            let manager = CLLocationManager()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            return manager
        }()
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
        coreManager.delegate = self
        myTableView.register(UINib(nibName: "HourlyTableViewCell", bundle: nil), forCellReuseIdentifier: HourlyTableViewCell.key)
        myTableView.register(UINib(nibName: "DailyTableViewCell", bundle: nil), forCellReuseIdentifier: DailyTableViewCell.key)
        myTableView.backgroundColor = .clear
            guard let cityName = UserDefaults.standard.string(forKey: Constants.keyState) else {return}
                if UserDefaults.standard.bool(forKey: Constants.buttonState) {
                    DispatchQueue.main.async {
                        self.getWeatherByCityName(cityName: cityName)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.editState = .currentLocationWeather
                        self.coreManager.startUpdatingLocation()
                    }
                }
        }
        
    fileprivate func getCoordinateByCityName() {
        let alertMessage = UIAlertController(title: "Get city weather.", message: "Please, enter city name!", preferredStyle: .alert)
        alertMessage.addTextField { [weak self] cityNameTextField in
            guard let self = self else {return}
            cityNameTextField.placeholder = "City name"
            self.cityName = cityNameTextField
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        let okButton = UIAlertAction(title: "Ok", style: .cancel) { [weak self] _ in
            guard let self = self, let cityName = self.cityName.text else {return}
            self.getWeatherByCityName(cityName: cityName)
            }
        alertMessage.addAction(okButton)
        alertMessage.addAction(cancelButton)
        present(alertMessage, animated: true)
        }
        
        func getWeatherByCityName(cityName: String) {
            self.apiProvider.getCoordinateByCityName(cityName: cityName) { result in
                switch result {
                case .success(let value):
                    DispatchQueue.main.async {
                    self.currentLocation = value
                    if let city = value.first {
                        self.getWeatherByCoordinate(city: city)
                        }
                    }
                case .failure:
                    let alertErrorMessage = UIAlertController(title: "Warning!", message: "Enter existing city!", preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Ok", style: .cancel)
                    alertErrorMessage.addAction(okButton)
                    self.present(alertErrorMessage, animated: true)
                    }
                }
        }
    private func getWeatherByCoordinate(city: CityCoordinate) {
        apiProvider.getWeatherByCityCoordinate(latitude: city.latitude, longitude: city.longitude) { [weak self] result in
            guard let self = self else {return}
            switch result {
              case .success(let value):
                DispatchQueue.main.async {
                    self.dailyWeather = value.dailyWeather
                    self.currentWeather = value.current
                    self.hourlyModels = value.hourlyWeather
                }
                self.realmDataBase.getDataBase(value: value)
                self.localNotification.createLocalNotification(valueWeather: value.hourlyWeather)
                
                DispatchQueue.main.async {
                    guard let mainWeather = self.currentWeather.weather.first?.main else {return}
                    let backgroundImage = self.getImageForBackground(mainWeather: mainWeather)
                    self.myTableView.tableHeaderView = self.createTableHeader()
                    self.myTableView.reloadData()
                    self.imageWeatherView.contentMode = .scaleAspectFill
                    self.imageWeatherView.image = backgroundImage
                }
                UserDefaults.standard.set(true, forKey: Constants.buttonState)
                UserDefaults.standard.set(city.cityName, forKey: Constants.keyState)
                self.editState = .cityWeather
                self.coreManager.stopUpdatingLocation()
               
              case .failure:
                let alertErrorMessage = UIAlertController(title: "Warning!", message: "Data not received!", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .cancel)
                alertErrorMessage.addAction(okButton)
                self.present(alertErrorMessage, animated: true)
            }
        }
    }
        @IBAction func currentLocationButton(_ sender: Any) {
            coreManager.requestWhenInUseAuthorization()
            coreManager.startUpdatingLocation()
            editState = .currentLocationWeather
            UserDefaults.standard.set(false, forKey: Constants.buttonState)
        }
        
        
        @IBAction func addCity(_ sender: Any) {
            getCoordinateByCityName()
            UserDefaults.standard.set(true, forKey: Constants.buttonState)
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
            
            guard let weather = currentWeather.weather.first?.weatherDescription else {
                return UIView()
            }
            currentLocationLabel.text = editState == .currentLocationWeather ? "Current Location" : currentLocation.first?.cityName
            weatherDiscription.text = weather.capitalized

            return tableHeader
        }
    }

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
            UserDefaults.standard.set(false, forKey: Constants.buttonState)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else {return}
        apiProvider.getWeatherByCityCoordinate(latitude: location.latitude, longitude: location.longitude) { [weak self] result in
            guard let self = self else {return}
            switch result {
              case .success(let value):
                DispatchQueue.global(qos: .userInitiated).async {
                    self.dailyWeather = value.dailyWeather
                    self.currentWeather = value.current
                    self.hourlyModels = value.hourlyWeather
                }
                self.realmDataBase.getDataBase(value: value)
                self.localNotification.createLocalNotification(valueWeather: value.hourlyWeather)
                guard let mainWeather = self.currentWeather.weather.first?.main else {return}
                let backgroundImage = self.getImageForBackground(mainWeather: mainWeather)
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                    self.myTableView.tableHeaderView = self.createTableHeader()
                    self.imageWeatherView.contentMode = .scaleAspectFill
                    self.imageWeatherView.image = backgroundImage
                }
                self.coreManager.stopUpdatingLocation()
              case .failure:
                let alertErrorMessage = UIAlertController(title: "Warning!", message: "Data not received!", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .cancel)
                alertErrorMessage.addAction(okButton)
                self.present(alertErrorMessage, animated: true)

            }
        }
    }
}
