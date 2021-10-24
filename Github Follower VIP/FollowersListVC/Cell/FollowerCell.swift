//
//  FollowerCell.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 13/10/21.
//

import UIKit

protocol FollowerCellViewModel {
    var imageName: String { get }
}

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"

    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 8
        profileImage.clipsToBounds = true
    }
    
    func set(follower: FollowerCellViewModel) {
        profileImage.set(imageUrl: follower.imageName)
    }
}
