//
//  SettingsViewController.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    static let key = "SettingsViewController"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SettingsTabBarItem".localizable()
        settingsTableView.register(UINib(nibName: "AdverseWeatherConditions", bundle: nil), forCellReuseIdentifier: AdverseWeatherConditions.key)
    
        }
    

    }
