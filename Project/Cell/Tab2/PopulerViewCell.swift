//
//  PopulerViewCell.swift
//  Project
//
//  Created by Aykut Doğru on 15.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import UIKit

class PopulerViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	@IBOutlet weak var movieImage: UIImageView!
	@IBOutlet weak var movieName: UILabel!
	@IBOutlet weak var movieYear: UILabel!
	
	func configure(with item: Results) {
		self.movieImage.sd_setImage(with: URL(string: item.movieImage ))
		self.movieName.text = item.movieTitle
		self.movieYear.text = String(describing: item.movieYear)
	}
}
