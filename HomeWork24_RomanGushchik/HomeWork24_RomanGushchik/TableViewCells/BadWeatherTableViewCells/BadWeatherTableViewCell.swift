//
//  BadWeatherTableViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import UIKit

class BadWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var badWeatherConditionLabel: UILabel!
    @IBOutlet weak var setImage: UIImageView!
    static let key = "BadWeatherTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    override var isSelected: Bool  {
        didSet {
            setImage.image = UIImage(systemName: isSelected ? "circle.inset.filled" : "circle" )
        }
    }
    
    func configure(array: Main) {
        badWeatherConditionLabel.text = array.rawValue
        setImage.tintColor = .red
        
    }
    
    
    
}
