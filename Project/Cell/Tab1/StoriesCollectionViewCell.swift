//
//  StoriesCollectionViewCell.swift
//  Project
//
//  Created by Aykut Doğru on 14.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import UIKit
import SDWebImage
class StoriesCollectionViewCell: UICollectionViewCell {
    
	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var userFullName: UILabel!
	@IBOutlet weak var bgView: UIView!
	@IBOutlet weak var liveImage: UIImageView!
	
	
	func configure(_ url: String, userFullName: String) {
		self.userImage.sd_setImage(with: URL(string: url))
		self.userFullName.text = userFullName
		self.bgView.layer.borderColor = UIColor(red: 57/255, green: 115/255, blue: 246/255, alpha: 1.0).cgColor
		self.bgView.layer.borderWidth = 3
		self.liveImage.isHidden = true
	}
}
