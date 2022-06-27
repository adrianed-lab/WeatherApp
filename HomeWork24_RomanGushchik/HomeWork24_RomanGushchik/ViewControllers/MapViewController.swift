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
    static let key = "MapViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
       // view.layoutSubviews()
        title = "Map"
        let camera = GMSCameraPosition.camera(withLatitude: 54.029, longitude: 27.597, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: conteinerForMapView.frame, camera: camera)
        conteinerForMapView.addSubview(mapView)
       view.addSubview(conteinerForMapView)
       // view.addSubview(mapView)

        mapView.delegate = self

        
        
    }
    

   

}
extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
    }
}
