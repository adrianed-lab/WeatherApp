//
//  BadWeatherViewController+Extension.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import Foundation
import UIKit
import Alamofire

extension BadWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        badWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = badWeatherTableView.dequeueReusableCell(withIdentifier: BadWeatherTableViewCell.key, for: indexPath) as? BadWeatherTableViewCell else {return UITableViewCell()}
        let uncomfortableWeather = badWeather[indexPath.row].badWeather
        cell.configure(array: badWeather[indexPath.row])
        cell.isSelected = badWeatherType.contains(uncomfortableWeather)
        DispatchQueue.main.async {
            if self.badWeatherType.contains(uncomfortableWeather) {
                self.badWeatherTableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        badWeatherTableView.cellForRow(at: indexPath)?.isSelected = true
        let uncomfortableWeather = badWeather[indexPath.row].badWeather
        badWeatherType.insert(uncomfortableWeather)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        badWeatherTableView.cellForRow(at: indexPath)?.isSelected = false
        let uncomfortableWeather = badWeather[indexPath.row].badWeather
        badWeatherType.remove(uncomfortableWeather)
    }
}
