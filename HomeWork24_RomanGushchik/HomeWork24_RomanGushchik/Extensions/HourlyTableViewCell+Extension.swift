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
        return CGSize(width: 60, height: 100)
   }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as! HourlyCollectionViewCell
        indexPath.row == 0 ? cell.configure(with: hourlyModels[indexPath.row], textForHour: "Now") : cell.configure(with: hourlyModels[indexPath.row], textForHour: hourlyModels[indexPath.row].dateTime.timeIntervalToStringDate(.short24HoursTime))
        return cell
    }
}
