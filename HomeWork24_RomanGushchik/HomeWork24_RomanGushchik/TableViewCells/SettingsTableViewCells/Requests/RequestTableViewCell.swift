//
//  RequestTableViewCell.swift
//  HomeWork24_RomanGushchik
//
//  Created by admin on 31.07.22.
//

import UIKit

class RequestTableViewCell: UITableViewCell {
    @IBOutlet weak var imageRequest: UIImageView!
    @IBOutlet weak var requestLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    static let key = "RequestTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func configure() {
        imageRequest.image = UIImage(systemName: "books.vertical.fill")
        imageRequest.tintColor = .white
        imageRequest.backgroundColor = .blue
        imageRequest.layer.cornerRadius = 10
        requestLabel.text = "HistoryTabBarItem".localizable()
        arrowImage.image = UIImage(systemName: "arrow.right")
        arrowImage.tintColor = .black
    }
}
