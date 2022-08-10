//
//  SettingsViewController.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    static let key = "SettingsViewController"
    var valueBadWeather: Results<RealmBadWeather>!
    var realmProtocol: RealmDataBaseProtocol!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SettingsTabBarItem".localizable()
        settingsTableView.register(UINib(nibName: "BadWeatherConditionsTableViewCell", bundle: nil), forCellReuseIdentifier: BadWeatherConditionsTableViewCell.key )
        settingsTableView.register(UINib(nibName: "RequestTableViewCell", bundle: nil), forCellReuseIdentifier: RequestTableViewCell.key)
        realmProtocol = RealmDataBase()
        valueBadWeather = realmProtocol.getBadWeather(nameObject: RealmBadWeather.self)
        
        }
    }
