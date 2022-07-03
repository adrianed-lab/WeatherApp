//
//  DailyTableViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var lowTempLabel: UILabel!
    @IBOutlet var hightTempLebl: UILabel!
    @IBOutlet var iconWeatherImage: UIImageView!
    static let key = "DailyTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(model: Daily) {
        self.lowTempLabel.text = "\(model.temperature.min)°"
        self.hightTempLebl.text = "\(model.temperature.max)°"
        self.dayLabel.text = model.dateTime.timeIntervalToStringDate(.mediumDate)
        guard let iconImage = model.weather.first?.icon else {return}
        self.iconWeatherImage.getWeatherImage(id: iconImage)
    }
}
