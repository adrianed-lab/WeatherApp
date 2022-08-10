//
//  SettingsViewControllert+Extension.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import Foundation
import UIKit


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = settingsTableView.dequeueReusableCell(withIdentifier: BadWeatherConditionsTableViewCell.key, for: indexPath) as? BadWeatherConditionsTableViewCell else {return UITableViewCell()}
            cell.configure()
            return cell
        } else {
            guard let cell = settingsTableView.dequeueReusableCell(withIdentifier: RequestTableViewCell.key, for: indexPath) as? RequestTableViewCell else {return UITableViewCell()}
            cell.configure()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            guard let badWeatherViewController = UIStoryboard(name: "BadWeather", bundle: nil).instantiateViewController(withIdentifier: BadWeatherViewController.key) as? BadWeatherViewController else {return}
           if let stateBadWeather = valueBadWeather.last?.badWeatherState {
               badWeatherViewController.badWeatherType = BadWeather(rawValue: stateBadWeather)
               print(stateBadWeather)

           } else {
               badWeatherViewController.badWeatherType = BadWeather(rawValue: 0)
           }
            navigationController?.pushViewController(badWeatherViewController, animated: true)
            settingsTableView.deselectRow(at: indexPath, animated: true)
            
        } else {
            guard let historyRequestViewController = UIStoryboard(name: "HistoryRequest", bundle: nil).instantiateViewController(withIdentifier: HistoryRequestViewController.key) as? HistoryRequestViewController else {return}
            navigationController?.pushViewController(historyRequestViewController, animated: true)
            settingsTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
    
}
