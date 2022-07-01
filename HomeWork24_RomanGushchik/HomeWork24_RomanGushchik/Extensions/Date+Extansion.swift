//
//  Extansion+Date.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import Foundation
import UIKit

extension Date {
    func getDayForDate(_ date: Self) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, yyyy"
        return formatter.string(from: date)
    }
    
    func getHoursForDate(_ date: Self) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }

   
}
