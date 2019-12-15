//
//  MoviesCollectionCell.swift
//  Project
//
//  Created by Aykut Doğru on 15.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import UIKit

class MoviesCollectionCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	@IBOutlet weak var movieImage: UIImageView!
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieYear: UILabel!
	@IBOutlet weak var movieGenre: UILabel!
	
	func config(with item: Results) {
		self.movieImage.sd_setImage(with: URL(string: item.movieImage))
		self.movieTitle.text = item.movieTitle
		self.movieYear.text = String(describing: item.movieYear)
		self.movieGenre.text = item.movieGenre
		self.movieTitle.sizeToFit()
	}
	
}
