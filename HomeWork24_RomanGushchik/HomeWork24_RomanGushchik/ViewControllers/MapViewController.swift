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
    var realmDateBase: RealmDataBaseProtocol!
    var localNotification: NotificationProtocol!


    override func viewDidLoad() {
        super.viewDidLoad()
        apiProvider = AlamofireAPIProvider()
        realmDateBase = RealmDataBase()
        localNotification = UserNotification()
        view.layoutSubviews()
        title = "Map"
        let camera = GMSCameraPosition.camera(withLatitude: 54.029, longitude: 27.597, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: conteinerForMapView.frame, camera: camera)
        conteinerForMapView.addSubview(mapView)
        mapView.delegate = self
        }
    }
