//
//  DataBaseViewController.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 3.07.22.
//

import UIKit
import RealmSwift

class HistoryRequestViewController: UIViewController {
    @IBOutlet weak var historyRequestTableView: UITableView!
    var collectionCurrentPlace: Results<CurrentPlaceData>!
    var realmDataBase: RealmDataBaseProtocol!
    var notificationToken: NotificationToken!
   
    
    static let key = "DataBaseViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HistoryRequest"
        historyRequestTableView.register(UINib(nibName: "HistoryRequestTableViewCell", bundle: nil), forCellReuseIdentifier: HistoryRequestTableViewCell.key)
        realmDataBase = RealmDataBase()
        collectionCurrentPlace = realmDataBase.getObject(nameObject: CurrentPlaceData.self)
        notificationToken = collectionCurrentPlace.observe({ [weak self] (changes: RealmCollectionChange) in
            guard let self = self else {return}
            guard let tableView = self.historyRequestTableView else {return}
            switch changes {
                case .initial:
                tableView.reloadData()
            case .update(_ , let deletions , let insertions, let modifications):
                    tableView.performBatchUpdates ({
                    tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    })
                case .error(let error):
                    fatalError("\(error)")
            }
        })
    }
    deinit {
        notificationToken.invalidate()
    }
}
