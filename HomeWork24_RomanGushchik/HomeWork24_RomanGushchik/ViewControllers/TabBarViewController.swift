//
//  TabBarViewController.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 27.06.22.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .black
        guard let weatherViewContoller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: WeatherViewController.key) as? WeatherViewController else {return}
        guard let mapViewController = UIStoryboard(name: "MapStoryboard", bundle: nil).instantiateViewController(withIdentifier: MapViewController.key) as? MapViewController else {return}
        guard let dataBaseViewController = UIStoryboard(name: "HistoryRequest", bundle: nil).instantiateViewController(withIdentifier: HistoryRequestViewController.key) as? HistoryRequestViewController else {return}
        
        viewControllers = [addViewController(viewController: UINavigationController(rootViewController: weatherViewContoller), title: "Weather".localizable(key: "WeatherTabBarItem"), image: UIImage(systemName: "cloud")), addViewController(viewController: UINavigationController(rootViewController: mapViewController), title: "Map".localizable(key: "MapTabBarItem"), image: UIImage(systemName: "map")), addViewController(viewController: UINavigationController(rootViewController: dataBaseViewController), title: "History Request".localizable(key: "HistoryTabBarItem"), image: UIImage(systemName: "books.vertical.fill"))]
        
       
    }
    
    private func addViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
        
    }

   
}
