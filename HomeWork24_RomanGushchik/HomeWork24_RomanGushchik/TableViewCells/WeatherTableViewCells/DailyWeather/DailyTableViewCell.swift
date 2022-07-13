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
        let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        contentView.addSubview(blurView)
        contentView.sendSubviewToBack(blurView)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(model: Daily) {
        self.lowTempLabel.text = "\(Int(model.temperature.min))°"
        self.hightTempLebl.text = "\(Int(model.temperature.max))°"
        self.dayLabel.text = model.dateTime.timeIntervalToStringDate(.mediumDate)
        guard let iconImage = model.weather.first?.icon else {return}
        self.iconWeatherImage.getWeatherImage(id: iconImage)
    }
    func configureForToDay(model: Daily) {
        self.lowTempLabel.text = "\(Int(model.temperature.min))°"
        self.hightTempLebl.text = "\(Int(model.temperature.max))°"
        self.dayLabel.text = "Today"
        guard let iconImage = model.weather.first?.icon else {return}
        self.iconWeatherImage.getWeatherImage(id: iconImage)
    }
}
