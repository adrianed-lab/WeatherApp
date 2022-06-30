//
//  Extansion+Date.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import Foundation
import UIKit

extension Date {
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, yyyy"
        return formatter.string(from: inputDate)
    }
}
