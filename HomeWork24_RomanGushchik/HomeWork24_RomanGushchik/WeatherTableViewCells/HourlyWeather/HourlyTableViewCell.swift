//
//  HourlyTableViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
    @IBOutlet var myCollectionView: UICollectionView!
    var models = [Hourly]()
    static let key = "HourlyTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.register(UINib(nibName: "HourlyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HourlyCollectionViewCell.key)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(with models: [Hourly]) {
        self.models = models
    }
}

