//
//  Extansion+Date.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import Foundation
import UIKit

enum DateFormat {
    case shortDate
    case short24HoursTime
    case fullDate
    
    var formatPattern: String {
        switch self {
        case .shortDate:
            return "EEEE"
        case .short24HoursTime:
            return "HH:mm"
        case .fullDate:
            return "d MMM, h:mm a"
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
