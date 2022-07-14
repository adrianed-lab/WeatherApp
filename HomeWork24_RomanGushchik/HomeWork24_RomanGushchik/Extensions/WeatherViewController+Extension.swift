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
         return dailyWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.key, for: indexPath) as! HourlyTableViewCell
            cell.configure(with: hourlyModels)
            return cell
        }
        else {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.key, for: indexPath) as! DailyTableViewCell
            indexPath.row == 0 ? cell.configure(model: dailyWeather[indexPath.row], textForDay: "Today") : cell.configure(model: dailyWeather[indexPath.row], textForDay: dailyWeather[indexPath.row].dateTime.timeIntervalToStringDate(.shortDate))
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 100 : 60
    }
    
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
            header.backgroundColor = .clear
            let imageViewForSection = section == 0 ? UIImageView(image: UIImage(systemName: "clock")) : UIImageView(image: UIImage(systemName: "calendar"))
            imageViewForSection.tintColor = .red
            header.addSubview(imageViewForSection)
            imageViewForSection.frame = CGRect(x: 5, y: 5, width: header.frame.size.height - 10, height: header.frame.size.height - 10)
            let label = UILabel(frame: CGRect(x: 10 + imageViewForSection.frame.size.width, y: 5, width: header.frame.size.width - 15 - imageViewForSection.frame.size.width, height: header.frame.size.height - 10))
            header.addSubview(label)
            label.textColor = .red
            label.text = section == 0 ? "HOURLY FORECAST" : "8-DAY FORECAST"
            return header
    }
}
