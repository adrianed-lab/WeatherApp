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
        let hoursTime = Date()
        self.tempLabel.text = "\(model.temperature)°"
        self.hoursLabel.text = hoursTime.getHoursForDate(Date(timeIntervalSince1970: Double(model.dateTime)))
        guard let iconImage = model.weather.first?.icon else {return}
        guard let imageUrl = URL(string: "\(Constants.baseURLForWeatherImage)\(iconImage)\(Constants.weatherImageIconURLPrefix)") else {return}
        if let data = try? Data(contentsOf: imageUrl) {
            self.self.iconImageView.image = UIImage(data: data)
        }
    }
}
