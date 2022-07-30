//
//  String+Extension.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 27.07.22.
//

import Foundation
import UIKit

extension String {
    func localizable() -> String {
        NSLocalizedString(self, tableName: "", bundle: .main, value: self, comment: "")
    }
}
