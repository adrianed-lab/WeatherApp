//
//  WeatherViewController+Extension.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 1.07.22.
//

import Foundation
import UIKit

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
         return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.key, for: indexPath) as! HourlyTableViewCell
            cell.configure(with: hourlyModels)
            return cell
        }
        else {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.key, for: indexPath) as! DailyTableViewCell
            cell.configure(model: models[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    

}
