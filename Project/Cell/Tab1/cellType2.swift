//
//  cellType2.swift
//  Project
//
//  Created by Aykut Doğru on 14.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import UIKit

class cellType2: UITableViewCell {

	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var userFullName: UILabel!
	@IBOutlet weak var postDate: UILabel!
	@IBOutlet weak var postMessage: UILabel!
	@IBOutlet weak var postImage: UIImageView!
	@IBOutlet weak var likeCount: UILabel!
	@IBOutlet weak var commentCount: UILabel!
	
	
	func configure(with item: Response) {
		self.userImage.sd_setImage(with: URL(string: item.userImageUrl))
		self.userFullName.text = item.userFullName
		self.postDate.text = item.createdAt
		self.postMessage.text = item.postMessage
		self.postImage.sd_setImage(with: URL(string: item.postImage))
		self.likeCount.text = String(describing: item.likeCount)
		self.commentCount.text = String(describing: item.commentCount)
	}
	
}
