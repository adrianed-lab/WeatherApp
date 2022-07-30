//
//  UIImageView+Extension.swift
//  HomeWork24_RomanGushchik
//
//  Created by Vadim Khadyka on 3.07.22.
//

import Foundation
import UIKit

extension UIImageView {
    func getWeatherImage(id: String) {
        
        guard let imageUrl = URL(string: "\(Constants.baseURLForWeatherImage)\(id)\(Constants.weatherImageIconURLPrefix)") else {return}
        DispatchQueue.global(qos: .utility).async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
