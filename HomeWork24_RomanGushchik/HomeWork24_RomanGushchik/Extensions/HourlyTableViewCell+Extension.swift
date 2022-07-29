//
//  HourlyTableViewCell+Extension.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 1.07.22.
//

import Foundation
import UIKit

extension HourlyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: indexPath.row != 0 ? 60 : 80, height: 100)
   }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as? HourlyCollectionViewCell else {return UICollectionViewCell()}
        DispatchQueue.main.async {
            cell.configure(with: self.hourlyModels[indexPath.row], textForHour: indexPath.row == 0 ? "Now".localizable() : self.hourlyModels[indexPath.row].dateTime.timeIntervalToStringDate(.short24HoursTime))
        }
        return cell
    }
}
