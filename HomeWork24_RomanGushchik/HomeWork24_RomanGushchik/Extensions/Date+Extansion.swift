//
//  Extansion+Date.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import Foundation
import UIKit

enum DateFormat: String {
    case dateForDay = "d MMM, yyyy"
    case dateForHour = "h:mm a"
}

extension TimeInterval {
    func getDate(_ dateTime: Int, _ dateFormat: DateFormat) -> String {
        let timeInterval = TimeInterval(dateTime)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.string(from: date)
    }
    
}
