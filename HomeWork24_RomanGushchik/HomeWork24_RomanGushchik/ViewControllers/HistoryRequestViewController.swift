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
    let realm = try! Realm()
    var collectionCurrentPlace: Results<CurrentPlaceData>!
   
    
    static let key = "DataBaseViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HistoryRequest"
        historyRequestTableView.register(UINib(nibName: "HistoryRequestTableViewCell", bundle: nil), forCellReuseIdentifier: HistoryRequestTableViewCell.key)
        collectionCurrentPlace = realm.objects(CurrentPlaceData.self)
        historyRequestTableView.reloadData()
    }
}
