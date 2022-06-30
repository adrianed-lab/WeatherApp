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
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configure(with model: Hourly) {
        self.tempLabel.text = "\(model.temperature)"
        guard let iconImage = model.weather.first?.icon else {return}
        guard let imageUrl = URL(string: "https://openweathermap.org/img/wn/\(iconImage)@2x.png") else {return}
        if let data = try? Data(contentsOf: imageUrl) {
            self.self.iconImageView.image = UIImage(data: data)
        }
       
    }

}
