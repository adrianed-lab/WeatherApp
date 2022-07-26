//
//  HourlyTableViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 30.06.22.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
    @IBOutlet var myCollectionView: UICollectionView!
    var hourlyModels = [Hourly]()
    static let key = "HourlyTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.register(UINib(nibName: "HourlyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HourlyCollectionViewCell.key)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        DispatchQueue.main.async {
            let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
            let blurView = UIVisualEffectView(effect: blur)
            blurView.alpha = 0.5
            blurView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height)
            self.contentView.addSubview(blurView)
            self.contentView.sendSubviewToBack(blurView)
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(with models: [Hourly]) {
        DispatchQueue.main.async {
            self.hourlyModels = models
            self.myCollectionView.reloadData()
        }
    }
}

