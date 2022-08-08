//
//  BadWeatherConditionsTableViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import UIKit

class BadWeatherConditionsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageBadWeather: UIImageView!
    @IBOutlet weak var badWeatherLabel: UILabel!
    static let key = "BadWeatherConditionsTableViewCell"
    @IBOutlet weak var imageArrow: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configure() {
        imageBadWeather.image = UIImage(systemName: "cloud.bolt.rain.fill")
        imageBadWeather.backgroundColor = .blue
        imageBadWeather.tintColor = .white
        imageBadWeather.layer.cornerRadius = 10
        badWeatherLabel.text = "Add Bad Weather Conditions".localizable()
        imageArrow.image = UIImage(systemName: "arrow.right")
        imageArrow.tintColor = .black
    }
    
}
