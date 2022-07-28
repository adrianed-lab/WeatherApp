//
//  HistoryRequestTableViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 6.07.22.
//

import UIKit
import RealmSwift

class HistoryRequestTableViewCell: UITableViewCell {
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var flagState: UILabel!
    @IBOutlet weak var myStackView: UIStackView!
    static let key = "HistoryRequestTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(model: CurrentPlaceData) {
        self.latitudeLabel.text = String(format: NSLocalizedString("Latitude", comment: ""), Int(model.lat))
        self.longitudeLabel.text = String(format: NSLocalizedString("Longitude", comment: ""), Int(model.lon))
        self.weatherLabel.text = model.currentWeather.weatherDiscription
        self.temperatureLabel.text = String(format: NSLocalizedString("Temp", comment: ""), Int(model.currentWeather.temp))
        self.feelsLikeLabel.text = String(format: NSLocalizedString("FeelsLike", comment: ""), Int(model.currentWeather.feelsLike))
        self.dateTimeLabel.text = model.currentWeather.dateTime.timeIntervalToStringDate(.fullDate)
        self.flagState.text = String(format: NSLocalizedString("FlagState", comment: ""), model.requestFlag)
    }
}
