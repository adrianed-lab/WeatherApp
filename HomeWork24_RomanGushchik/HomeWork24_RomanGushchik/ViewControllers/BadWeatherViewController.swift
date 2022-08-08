//
//  BadWeatherViewController.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import UIKit
import RealmSwift

class BadWeatherViewController: UIViewController {
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var badWeatherTableView: UITableView!
    static let key = "BadWeatherViewController"
    var badWeather: [Main] =  [.rain, .thunderstorm, .snow]
    var badWeatherType: BadWeather = BadWeather()
    var realmProtocol: RealmDataBaseProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Set Bad Weather".localizable()
        badWeatherTableView.register(UINib(nibName: "BadWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: BadWeatherTableViewCell.key)
       realmProtocol = RealmDataBase()
        badWeatherTableView.allowsMultipleSelection = true
    }
    
    @IBAction func saveWeatherConditions(_ sender: Any) {
        realmProtocol.setBadWeatherRawValue(rawValue: badWeatherType.rawValue)
        }
    }

