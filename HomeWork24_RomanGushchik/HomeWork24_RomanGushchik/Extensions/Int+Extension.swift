//
//  Extansion+Date.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import Foundation
import UIKit

enum DateFormat {
    case mediumDate
    case short12HoursTime
    
    var formatPattern: String {
        switch self {
        case .mediumDate:
            return "d MMM, yyyy"
        case .short12HoursTime:
            return "h:mm a"
        }
    }
    
}

extension Int {
    func timeIntervalToStringDate(_ dateFormat: DateFormat) -> String {
        //тут не нужно конвертировать в double, т.к.  TimeInterval принимает Int
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.formatPattern
        return dateFormatter.string(from: date)
    }
    
}
