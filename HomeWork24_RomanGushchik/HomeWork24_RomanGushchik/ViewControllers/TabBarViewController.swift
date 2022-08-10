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
        guard let weatherViewContoller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: WeatherViewController.key) as? WeatherViewController, let mapViewController = UIStoryboard(name: "MapStoryboard", bundle: nil).instantiateViewController(withIdentifier: MapViewController.key) as? MapViewController, let settingsViewController = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: SettingsViewController.key) as? SettingsViewController else {return}
        
        viewControllers = [addViewController(viewController: UINavigationController(rootViewController: weatherViewContoller), title: "TitleWeather".localizable(), image: UIImage(systemName: "cloud")), addViewController(viewController: UINavigationController(rootViewController: mapViewController), title: "Map".localizable(), image: UIImage(systemName: "map")), addViewController(viewController: UINavigationController(rootViewController: settingsViewController), title: "SettingsTabBarItem".localizable(), image: UIImage(systemName: "gear"))]
        
       
    }
    
    private func addViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
        
    }

   
}
