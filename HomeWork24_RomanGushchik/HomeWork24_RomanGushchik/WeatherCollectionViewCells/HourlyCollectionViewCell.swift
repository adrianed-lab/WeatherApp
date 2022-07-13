//
//  HourlyCollectionViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    static let key = "HourlyCollectionViewCell"
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var hoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with model: Hourly) {
        self.tempLabel.text = "\(Int(model.temperature))°"
        self.hoursLabel.text = model.dateTime.timeIntervalToStringDate(.short24HoursTime)
        guard let iconImage = model.weather.first?.icon else {return}
        self.iconImageView.getWeatherImage(id: iconImage)
    }
    func configureForNow(with model: Hourly) {
        self.tempLabel.text = "\(Int(model.temperature))°"
        self.hoursLabel.text = "Now"
        guard let iconImage = model.weather.first?.icon else {return}
        self.iconImageView.getWeatherImage(id: iconImage)
    }
}
