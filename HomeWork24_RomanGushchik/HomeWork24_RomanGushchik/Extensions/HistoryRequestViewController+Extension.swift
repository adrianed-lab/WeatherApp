//
//  HistoryRequestViewController+Extension.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 6.07.22.
//

import Foundation
import UIKit
import RealmSwift

extension HistoryRequestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if collectionCurrentPlace.count != 0 {
            return collectionCurrentPlace.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HistoryRequestTableViewCell.key, for: indexPath) as? HistoryRequestTableViewCell {
            let item = collectionCurrentPlace[indexPath.row]
            cell.configure(model: item)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
