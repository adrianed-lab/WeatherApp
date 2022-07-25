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
            DispatchQueue.main.async {
                cell.configure(with: self.hourlyModels)
            }
            return cell
        }
        else {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.key, for: indexPath) as! DailyTableViewCell
            DispatchQueue.main.async {
                cell.configure(model: self.dailyWeather[indexPath.row], textForDay: indexPath.row == 0 ? "Today" : self.dailyWeather[indexPath.row].dateTime.timeIntervalToStringDate(.shortDate))
            }
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
            let imageViewForSection = UIImageView(image: UIImage(systemName: section == 0 ? "clock" : "calendar"))
            imageViewForSection.tintColor = .white
            header.addSubview(imageViewForSection)
            imageViewForSection.frame = CGRect(x: 5, y: 5, width: header.frame.size.height - 10, height: header.frame.size.height - 10)
            let label = UILabel(frame: CGRect(x: 10 + imageViewForSection.frame.size.width, y: 5, width: header.frame.size.width - 15 - imageViewForSection.frame.size.width, height: header.frame.size.height - 10))
            DispatchQueue.main.async {
                let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.alpha = 0.8
                blurView.frame = CGRect(x: 0, y: 0, width: header.frame.size.width, height: header.frame.size.height)
                blurView.layer.masksToBounds = true
                blurView.layer.cornerRadius = header.frame.size.width/45
                header.addSubview(blurView)
                header.sendSubviewToBack(blurView)
            }
            header.addSubview(label)
            label.textColor = .white
            label.text = section == 0 ? "HOURLY FORECAST" : "8-DAY FORECAST"
            return header
    }
}

enum EditState {
    case currentLocationWeather
    case cityWeather
}


