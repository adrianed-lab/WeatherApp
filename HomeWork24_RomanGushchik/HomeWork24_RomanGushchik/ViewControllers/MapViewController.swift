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
    var myMarker = GMSMarker()
    static let key = "MapViewController"
    var apiProvider: RestAPIProviderProtocol!
    var realmDateBase: RealmDataBaseProtocol!
    var currentWeather: Current!
    var infoMarkerWindow: CustomInfoWindow!


    override func viewDidLoad() {
        super.viewDidLoad()
        apiProvider = AlamofireAPIProvider()
        realmDateBase = RealmDataBase()
        view.layoutSubviews()
        title = "Map".localizable(key: "MapTabBarItem")
        let camera = GMSCameraPosition.camera(withLatitude: 54.029, longitude: 27.597, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: conteinerForMapView.frame, camera: camera)
        conteinerForMapView.addSubview(mapView)
        mapView.delegate = self
        }
    }
