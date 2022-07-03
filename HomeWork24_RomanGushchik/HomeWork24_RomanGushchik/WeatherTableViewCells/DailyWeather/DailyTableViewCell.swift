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
        let dateTime = TimeInterval(model.dateTime)
        self.dayLabel.text = dateTime.getDate(dateTime, DateFormat.dateForDay)
        guard let iconImage = model.weather.first?.icon else {return}
        guard let imageUrl = URL(string: "\(Constants.baseURLForWeatherImage)\(iconImage)\(Constants.weatherImageIconURLPrefix)") else {return}
        if let data = try? Data(contentsOf: imageUrl) {
            self.iconWeatherImage.image = UIImage(data: data)
        }
    }
}
