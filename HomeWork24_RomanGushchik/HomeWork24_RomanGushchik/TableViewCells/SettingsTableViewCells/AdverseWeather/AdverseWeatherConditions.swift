//
//  SettingsTableViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import UIKit

class AdverseWeatherConditions: UITableViewCell {
    static let key = "AdverseWeatherConditions"
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
