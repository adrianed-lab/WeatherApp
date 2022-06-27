//
//  MapViewController.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 27.06.22.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    @IBOutlet weak var conteinerForMapView: UIView!
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var weatherImageIcon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var weatherDiscription: UILabel!
    static let key = "MapViewController"
    var apiProvider: RestAPIProviderProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        apiProvider = AlamofireAPIProvider()
        view.layoutSubviews()
        title = "Map"
        let camera = GMSCameraPosition.camera(withLatitude: 54.029, longitude: 27.597, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: conteinerForMapView.frame, camera: camera)
        conteinerForMapView.addSubview(mapView)
        mapView.delegate = self
    }
}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        apiProvider.getWeatherByCityCoordinate(latitude: coordinate.latitude, longitude: coordinate.longitude) { [weak self]result in
            guard let self = self else {return}
            switch result {
                case .success(let value):
                DispatchQueue.main.async {
                self.weatherView.backgroundColor = .blue
                self.conteinerForMapView.addSubview(self.weatherView)
                self.temperature.text = "\(value.current.temperature)"
                self.feelsLike.text = "FeelLike: \(value.current.feelsLike)"
                self.weatherDiscription.text = value.current.weather.first?.weatherDescription
                guard let imageWeatherIcon = value.current.weather.first?.icon else {return}
                guard let imageUrl = URL(string: "https://openweathermap.org/img/wn/\(imageWeatherIcon)@2x.png") else {return}
                    if let imageData = try? Data(contentsOf: imageUrl) {
                    self.weatherImageIcon.image = UIImage(data: imageData)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
