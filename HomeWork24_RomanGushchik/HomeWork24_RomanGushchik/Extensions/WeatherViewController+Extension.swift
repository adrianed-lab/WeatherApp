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
            if indexPath.row == 0 {
                cell.configureForToDay(model: dailyWeather[indexPath.row])
                return cell
            }
            cell.configure(model: dailyWeather[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 60
    }
    
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
            header.backgroundColor = .clear
            let imageView = UIImageView(image: UIImage(systemName: "clock"))
            imageView.tintColor = .orange
            header.addSubview(imageView)
            imageView.frame = CGRect(x: 5, y: 5, width: header.frame.size.height - 10, height: header.frame.size.height - 10)
            let label = UILabel(frame: CGRect(x: 10 + imageView.frame.size.width, y: 5, width: header.frame.size.width - 15 - imageView.frame.size.width, height: header.frame.size.height - 10))
            header.addSubview(label)
            label.textColor = .orange
            label.text = "HOURLY FORECAST"
            return header
        } else {
            let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
            header.backgroundColor = .clear
            let imageView = UIImageView(image: UIImage(systemName: "calendar"))
            imageView.tintColor = .orange
            header.addSubview(imageView)
            imageView.frame = CGRect(x: 5, y: 5, width: header.frame.size.height - 10, height: header.frame.size.height - 10)
            let label = UILabel(frame: CGRect(x: 10 + imageView.frame.size.width, y: 5, width: header.frame.size.width - 15 - imageView.frame.size.width, height: header.frame.size.height - 10))
            header.addSubview(label)
            label.textColor = .orange
            label.text = "8-DAY FORECAST"
            return header
        }
    }
}
