//
//  MapViewController+Extension.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 1.07.22.
//

import Foundation
import UIKit
import GoogleMaps
import RealmSwift

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.myMarker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        self.myMarker.map = mapView
        apiProvider.getWeatherByCityCoordinate(latitude: coordinate.latitude, longitude: coordinate.longitude) { [weak self] result in
            guard let self = self else {return}
            switch result {
                case .success(let value):
                DispatchQueue.main.async {
                    guard let infoWindow = Bundle.main.loadNibNamed("InfoWindow", owner: self)?.first as? CustomInfoWindow, let weatherImage = value.current.weather.first?.icon else {return}
                    infoWindow.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
                    infoWindow.layer.cornerRadius = 25
                    infoWindow.speedWindLabel.text = String(format: NSLocalizedString("Wind speed", comment: ""), value.current.windSpeed)
                    infoWindow.currentTempLabel.text = String(format: NSLocalizedString("Temperature", comment: ""), Int(value.current.temperature))
                    infoWindow.imageWeather.getWeatherImage(id: weatherImage)
                    mapView.selectedMarker = self.myMarker
                    self.infoMarkerWindow = infoWindow
                }
                self.realmDateBase.getDataBase(value: value, state: false)
            case .failure(let error):
                print(error)
                }
            }
        }
    
   func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        infoMarkerWindow
    }
}

