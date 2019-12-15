//
//  MovieModel.swift
//  Project
//
//  Created by Aykut Doğru on 14.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import Foundation

struct Results: Codable {
	var isPopular: Bool
	var isRecommended: Bool
	var movieGenre: String
	var movieImage: String
	var movieTitle: String
	var movieYear: Int
}
